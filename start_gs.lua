local apply_err_flag
local temp_save_status = {}

local func_callback = function(string_rid)
    local new_status_id, new_apply_info
    local apply_id_list = {}
    new_status_id = 2
    new_apply_info = {}
    apply_id_list[new_status_id] = new_apply_info

    local status_id, new_status, condition
    local target_status = temp_save_status[string_rid] or {}
    for k, v in pairs(apply_id_list) do
        status_id = k
        condition = v
        condition.status_id = status_id
        new_status = true
        for i, info in ipairs(target_status) do
            if info.status_id == status_id then
                new_status = nil
                break
            else
                -- assert(not(info.status_id == status_id))
            end
        end
        if new_status then
            target_status[#target_status + 1] = condition
        end
    end
    local temp_t = {}
    local have_error
    for i, v in ipairs(target_status) do
        if temp_t[v.status_id] then
            if not apply_err_flag then
                apply_err_flag = 1
                print("I have checked whether it exists before putting it in the target_status, but it seems to have no effect\n")
                have_error = true
            end
        else
            temp_t[v.status_id] = 1
        end
    end
    temp_save_status[string_rid] = target_status
    if have_error then
        for i, v in ipairs(target_status) do
            print("target_status[", i, "] = ", v.status_id, type(v.status_id))
        end
    end
end

for i = 1, 300 do
    func_callback("defense_rid")
end

print("----------------------over----------------------------")

