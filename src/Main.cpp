#include "Application.hpp"
#include <stdexcept>
#include <iostream>
#include <cstdlib>

int main()
{
    Application app;

    try 
    {
        app.run();
    }
    catch (const std::exception& e)
    {
        std::cerr << e.what() << "\n";
        return EXIT_FAILURE;
    }

    return EXIT_SUCCESS;
}
