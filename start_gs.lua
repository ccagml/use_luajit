local temp_save_status = {}

local func_callback = function(string_rid, for_i)
    local apply_id_list = {}
    local new_status_id = 2
    local new_apply_info = {}
    apply_id_list[new_status_id] = new_apply_info

    local status_id, new_status
    local target_status = temp_save_status[string_rid] or {}
    for k, v in pairs(apply_id_list) do
        status_id = k
        v.status_id = status_id
        new_status = true
        for i, info in ipairs(target_status) do
            if info.status_id == status_id then
                new_status = nil
                break
            else
                print("error--- for_i == 95? ", (for_i == 95), for_i, info.status_id, status_id, info.status_id == status_id)
                assert(not (info.status_id == status_id))
            end
        end
        if new_status then
            target_status[#target_status + 1] = v
        end
    end
    temp_save_status[string_rid] = target_status
end


for i = 1, 300 do
    func_callback("defense_rid", i)
end

print("----------------------over----------------------------")

