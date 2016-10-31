#include "register_types.h"
#include "object_type_db.h"
#include "core/globals.h"
#include "ios/src/gomob.h"

void register_gomob_types() {
    Globals::get_singleton()->add_singleton(Globals::Singleton("Gomob", memnew(Gomob)));
}

void unregister_gomob_types() {
}
