-- ============================================================================
-- modules
-- ============================================================================
local json = self and require("dkjson") or nil

-- module table
vectorutils = {}

function vectorutils.vector_from_array(columns, array)
    local vec = {}

    for i=1,columns do
        v = array[i] or 0
        table.insert(vec, v)
    end

    return vec
end

function vectorutils.vector_to_string(vec)
    -- vector to custom table
    local vec_table = {}

    vec_table["columns"] = vectorutils.columns(vec)
    vec_table["array"] = vectorutils.vector_to_array(vec)

    -- custom table to json string
    local json_str = json.encode(vec_table)

    return json_str
end

-- return module table
return vectorutils
