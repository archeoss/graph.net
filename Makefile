ifeq ($(shell uname),Darwin)
    EXT := dylib
else
    EXT := so
endif

all: lib/libgraph_net.$(EXT)
	g++ src/main.cpp -L ./lib -lgraph_net -o run
	LD_LIBRARY_PATH=./lib ./run

lib/libgraph_net.$(EXT): src/lib.rs Cargo.toml
	cargo build
	cp target/debug/libgraph_net.$(EXT) lib/libgraph_net.$(EXT)

clean:
	rm -rf target
	rm -rf run