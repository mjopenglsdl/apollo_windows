/******************************************************************************
 * Copyright 2018 The Apollo Authors. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *****************************************************************************/

#ifndef CYBER_TRANSPORT_SHM_MULTICAST_NOTIFIER_H_
#define CYBER_TRANSPORT_SHM_MULTICAST_NOTIFIER_H_

#ifndef __WIN32__
  #include <netinet/in.h>
#endif

#include <atomic>

#include "cyber/common/macros.h"
#include "cyber/transport/shm/notifier_base.h"

namespace apollo {
namespace cyber {
namespace transport {

class MulticastNotifier : public NotifierBase {
 public:
  virtual ~MulticastNotifier();

  void Shutdown() override;
  bool Notify(const ReadableInfo& info) override;
  bool Listen(int timeout_ms, ReadableInfo* info) override;

  static const char* Type() { return "multicast"; }

 private:
  bool Init();

  int notify_fd_ = -1;

#ifndef __WIN32__
  struct sockaddr_in notify_addr_;
#endif

  int listen_fd_ = -1;

#ifndef __WIN32__
  struct sockaddr_in listen_addr_;
#endif

  std::atomic<bool> is_shutdown_ = {false};

  DECLARE_SINGLETON_DLL(MulticastNotifier)
};

}  // namespace transport
}  // namespace cyber
}  // namespace apollo

#endif  // CYBER_TRANSPORT_SHM_MULTICAST_NOTIFIER_H_
