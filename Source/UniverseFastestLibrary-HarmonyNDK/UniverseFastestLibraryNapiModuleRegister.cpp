#include "Func.h"

EXTERN_C_START
static napi_value Init( napi_env env, napi_value exports )
{
	/*napi_property_descriptor desc[] = {
		{ "add", nullptr, Add, nullptr, nullptr, nullptr, napi_default, nullptr },
		{ "sub", nullptr, Sub, nullptr, nullptr, nullptr, napi_default, nullptr }
	};
	napi_define_properties( env, exports, sizeof( desc ) / sizeof( desc[ 0 ] ), desc );*/
	return exports;
}
EXTERN_C_END

static napi_module demoModule = {
	.nm_version = 1,
	.nm_flags = 0,
	.nm_filename = nullptr,
	.nm_register_func = Init,
	.nm_modname = "UniverseFastestLibrary",
	.nm_priv = ( ( void * )0 ),
	.reserved = { 0 },
};

extern "C" __attribute__( ( constructor ) ) void UniverseFastestLibraryNapiModuleRegister( void )
{
	//LOGI( Cu8vstr( "UniverseFastestLibrary " __DATE__ " " __TIME__ " NapiModuleRegister call" ) );

	napi_module_register( &demoModule );
}
