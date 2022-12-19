# CrowdControl++
Simple TCP connector for use with CrowdControl

# Example usage

### Threaded
For use if you don't have direct access to a main loop
```cpp
#include <ccpp.hpp>

ccpp crowdcontrol;

int main()
{
    crowdcontrol.register_effect("my_cool_effect", []()
    {
        //do my_cool_effect
        if(success) return ccpp::status_t::success;
        else return ccpp::status_t::retry;
    });

    crowdcontrol.initialize(true);
}
```

### Non-threaded
For use if you do have direct access to a main loop
```cpp
#include <ccpp.hpp>

ccpp crowdcontrol;

int main()
{
    crowdcontrol.register_effect("my_cool_effect", []()
    {
        //do my_cool_effect
        if(success) return ccpp::status_t::success;
        else return ccpp::status_t::retry;
    });

    crowdcontrol.initialize();
}

void main_loop()
{
    crowdcontrol.update();
    //do the rest of your stuff
}
```
