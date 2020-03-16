-- ============================================================================
-- modules
-- ============================================================================
local json = self and require("dkjson") or nil

-- module table
vectorutils = {}

function vectorutils.vector_from_array(columns, array)
    --[[
        Builds a vector from an array.

        :param cols: Column dimension of the vector.
        :type cols: int

        :param array: Table representing an array to build vector from.
        :type array: table

        :rtype: table
    ]]
    local vec = {}

    for i=1,columns do
        v = array[i] or 0
        table.insert(vec, v)
    end

    return vec
end

function vectorutils.vector_to_array(vec)
    --[[
        Builds an array from a vector.

        :param vec: Vector to build array from.
        :type vec: table

        :rtype: table
    ]]
    local arr = {}

    for _, v in ipairs(vec) do
        table.insert(arr, v)
    end

    return arr
end

function vectorutils.columns(vec)
    --[[
        Returns the amount of columns of a vector.

        :param vec: Vector to get column count from.
        :type vec: table

        :rtype: number
    ]]
    local columns = table.getn(vec)
    return columns
end

function vectorutils.vector_to_string(vec)
    --[[
        Builds an interchangeable json string from a vector.

        :param vec: Vector to build json string from.
        :type vec: table

        :rtype: string
    ]]
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
