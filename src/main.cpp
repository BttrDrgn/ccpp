#include <Windows.h>
#include "ccpp.hpp"

bool shutdown = false;
ccpp crowdcontrol;

int main(int argc, char* argv[])
{
	if (!crowdcontrol.initialize(false))
	{
		shutdown = true;
	};

	/*if (!crowdcontrol.initialize_ex("127.0.0.1", 58430, false))
	{
		shutdown = true;
	};*/

	crowdcontrol.register_trigger("test", []()
	{
		std::printf("test fired!");
		return ccpp::status_t::success;
	});

	while (!shutdown)
	{
		crowdcontrol.update();
	}

	return 0;
}
