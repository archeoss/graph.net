EXT := so

all: lib/libgraph_net.$(EXT)
	g++ -L./lib -lssl -lcrypto -lgraph_net src/main.cpp -o run 
	LD_LIBRARY_PATH=./lib ./run

lib/libgraph_net.$(EXT): src/lib.rs Cargo.toml
	cargo build
	cp target/debug/libgraph_net.$(EXT) lib/libgraph_net.$(EXT)

clean:
	rm -rf target
	rm -rf run