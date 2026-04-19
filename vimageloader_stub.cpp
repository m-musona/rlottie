#include "vector/vimageloader.h"

// ✅ Define the missing internal class
class VImageLoader::Impl {};

// Constructor / Destructor
VImageLoader::VImageLoader() : mImpl(new Impl()) {}

VImageLoader::~VImageLoader() = default;

// Stubbed load functions
VBitmap VImageLoader::load(const char*)
{
    return VBitmap();
}

VBitmap VImageLoader::load(const char*, size_t)
{
    return VBitmap();
}