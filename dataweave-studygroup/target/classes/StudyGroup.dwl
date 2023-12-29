/**
* This module will be shared through your library, feel free to modify it as you please.
*
* You can try it out with the mapping on the src/test/dw directory.
*/
%dw 2.0


fun deepRenameKey(o: Any, oldKeyName: String, newKeyName: String) = do {
    fun renameKey(existingKeyName: String): String =
        if (existingKeyName == oldKeyName) newKeyName
        else existingKeyName
    ---   
    o match {
        case o is Object -> o mapObject (value, key) -> {
            (renameKey(key)): deepRenameKey(value, oldKeyName, newKeyName)
        }
        case o is Array -> o map (item) -> deepRenameKey(item, oldKeyName, newKeyName)
        else -> o
    }

}