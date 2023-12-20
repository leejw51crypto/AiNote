git submodule update --init

# Check if ./llama.cpp/models/7B exists
if [ ! -d "./llama.cpp/models/7B" ]; then
    cd llama
    ./download2.sh

    cp ./llama/tokenizer.model ./llama.cpp/models
    cp ./llama/tokenizer_checklist.chk ./llama.cpp/models
    cp -Rf ./llama/llama-2-7b-chat ./llama.cpp/models/7B
fi

# Continue with the rest of the script
cd llama.cpp
./build.sh
./go.sh
cd ..
