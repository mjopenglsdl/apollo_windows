  
#include <cyber/binary.h>

// #include <iostream>
// using namespace std;

namespace apollo {
namespace cyber {

std::string Binary::GetName() 
{ 
    return GetNameRef(); 
}

void Binary::SetName(const std::string& name) { 
    // cout<<"set name: "<<name <<endl;
    GetNameRef() = name; 
}

std::string& Binary::GetNameRef() {
    static std::string binary_name;
    // cout<<"  GetNameRef: "<<binary_name <<endl;
    return binary_name;
}


}  // namespace cyber
}  // namespace apollo