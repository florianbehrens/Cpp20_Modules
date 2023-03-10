//module;

//#include <iostream>

export module mymodule;
export import :ipartition;
import :partition;
import <iostream>;

export {

void foo()
{
    std::cout << "Module interface unit\n";
    foo3b();
    foo4();
}

void foo2();

} // export
