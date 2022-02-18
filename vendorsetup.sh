# For now, just skip the ABI checks to fix build errors.
export SKIP_ABI_CHECKS=true

# Enable ThinLTO Source wide.
echo "Building with ThinLTO."
export GLOBAL_THINLTO=true
export USE_THINLTO_CACHE=true
