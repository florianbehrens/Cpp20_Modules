module;

#include <iostream>

export module mymodule:ipartition;

export void foo3a()
{
    std::cout << "Module interface partition\n";
}

void foo3b()
{
    std::cout << "Module interface partition (private function)\n";
}
