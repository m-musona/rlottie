#include "vimageloader.h"

/**
 * STAKELA ENGINE - VImageLoader Stub
 * This implementation satisfies the PIMPL pattern and unique_ptr requirements
 * without pulling in any image loading libraries.
 */

// 1. Define the internal struct so unique_ptr can be destroyed
struct VImageLoader::Impl {
    // We leave this empty since the engine handles actual texture loading
};

// 2. Constructor: Initialize the unique_ptr to nullptr or an empty Impl
VImageLoader::VImageLoader() : mImpl(nullptr) {}

// 3. Destructor: Now the compiler knows how to handle ~unique_ptr<Impl>()
VImageLoader::~VImageLoader() = default;

// 4. Load from File Path (Stub)
VBitmap VImageLoader::load(const char* /*fileName*/)
{
    return VBitmap();
}

// 5. Load from Memory (Stub)
VBitmap VImageLoader::load(const char* /*data*/, size_t /*len*/)
{
    return VBitmap();
}