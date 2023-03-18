CFLAGS = -std=c++17 #-O2
LDFLAGS = -lglfw -lvulkan -ldl -lpthread -lX11 -lXxf86vm -lXrandr -lXi

VulkanTest: main.cpp
	g++ $(CFLAGS) -o ./bin/VulkanTest main.cpp $(LDFLAGS)

debug: main.cpp
	g++ -g $(CFLAGS) -o ./bin/VulkanTestDebug main.cpp $(LDFLAGS)

.PHONY: test clean

test: VulkanTest
	./bin/VulkanTest

testDebug: debug
	./bin/VulkanTestDebug

clean:
	m -f VulkanTest
