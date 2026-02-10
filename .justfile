# Define variables for directories and main file
export MAIN            :="main"
export RELEASE_NAME    :="monograph"
export CONTENT_DIR     :="content"
export PDF_DIR         :="release"
export AUX_DIR         :="aux" 
export LOG_DIR         :=".log"


# Check and create the necessary directories for the release process
@create_release_dirs:
    echo "Creating necessary directories..."
    mkdir -p "$PDF_DIR"
    mkdir -p "$AUX_DIR"
    mkdir -p "$LOG_DIR"

# Compile the monograph into PDF for distribution
@release: create_release_dirs 
    echo "Compiling the monograph for release..."
    bash .scripts/compile.sh "$MAIN" "$PDF_DIR/$RELEASE_NAME.pdf" "$AUX_DIR" "$LOG_DIR"
