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

-- return module table
return vectorutils
