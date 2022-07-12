#godot_funcs.sh


#
function download_godot_headless() {
    local VERSION=$1
    GODOT_HEADLESS_URL=https://downloads.tuxfamily.org/godotengine/${VERSION}/Godot_v${VERSION}-stable_linux_headless.64.zip
    GODOT_HEADLESS_NAME=Godot_v${VERSION}-stable_linux_headless.64
    
    #
    if [ ! -f $CACHE_DIR/godot_headless.64 ]; then
        #
        output_section "Downloading Godot Headless v$VERSION executable..."

        curl -s $GODOT_HEADLESS_URL -o godot-headless.zip || exit 1
        
        unzip -o godot-headless.zip
        
        cp Godot_v${VERSION}-stable_linux_headless.64 $CACHE_DIR/godot_headless.64
        
        touch "$CACHE_DIR/._sc_"
    else
        output_section "Using cached Godot v$VERSION Headless executable"
    fi
    # copy godot headless executable
    #cp $CACHE_DIR/GODOT_HEADLESS_NAME $BUILD_DIR/godot_headless.64
    # Godot headless is stored at $BUILD_DIR/godot_headless.64
    output_section "Godot Headless setup done"
}


#
function download_godot_server() {
    #
    local VERSION=$1
    GODOT_SERVER_URL=https://downloads.tuxfamily.org/godotengine/${VERSION}/Godot_v${VERSION}-stable_linux_server.64.zip
    GODOT_SERVER_NAME=Godot_v${VERSION}-stable_linux_server.64
    
    #
    if [ ! -f $CACHE_DIR/GODOT_SERVER_NAME ]; then
        #
        output_section "Downloading Godot Server v$VERSION executable..."
    
        curl -s $GODOT_SERVER_URL -o godot-server.zip || exit 1
    
        unzip -o godot-server.zip
    
        cp Godot_v${VERSION}-stable_linux_server.64 $CACHE_DIR/GODOT_SERVER_NAME
    
        #touch "$CACHE_DIR/._sc_"
    else
        output_section "Using cached Godot v$VERSION Server executable"
    fi
    
    # copy godot server executable
    cp $CACHE_DIR/GODOT_SERVER_NAME $BUILD_DIR/godot_server.64
    # Godot server is stored at $BUILD_DIR/godot_server.64
    output_section "Godot Server setup done"
}

#
function download_godot_templates() {
    #
    local VERSION=$1
    GODOT_TEMPLATES_URL=https://downloads.tuxfamily.org/godotengine/${VERSION}/Godot_v${VERSION}-stable_export_templates.tpz
    TEMPLATES_DEST="$CACHE_DIR/editor_data/templates/${VERSION}.stable"
    
    #
    if [ ! -f $TEMPLATES_DEST/linux_x11_64_release ]; then
        output_section "Downloading Godot Linux Templates..."
        curl -s $GODOT_TEMPLATES_URL -o godot-templates.zip || exit 1
        unzip -o godot-templates.zip
        mkdir -p $TEMPLATES_DEST

        cp templates/linux_x11_64_debug $TEMPLATES_DEST
        cp templates/linux_x11_64_release $TEMPLATES_DEST

    else
        output_section "Using cached Godot Linux/X11 x64 Templates"
    fi
    
    # Godot export templates are stored at $CACHE_DIR/editor_data/templates/${VERSION}.stable
    output_section "Godot Templates setup done"
}

function export_godot_project() {
    OUTPUT_DEST="$BUILD_DIR/dist"
    OUTPUT_FILE="$OUTPUT_DEST/linux.pck"
    
    #
    output_section "Exporting Godot Server Project..."
    output_line "Target: '$OUTPUT_FILE'"
    
    # create folders
    mkdir -p $OUTPUT_DEST
    # Export the project to Linux/X11 
    # (The project must have a Linux/X11 export template setup)
    # source: $BUILD_DIR/dist
    # destinations: $OUTPUT_FILE
    $CACHE_DIR/godot_headless.64 --path "$BUILD_DIR" --export-pack "Linux/X11" "$OUTPUT_FILE" || exit 1
}