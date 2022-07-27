local apply_err_flag
local temp_save_status = {}

defense_info = {
    rid = "defense_rid"
}

function status_apply_status(string_rid, apply_id_list)

    local status_id

    local new_status
    local condition
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
            end
        end
        if new_status then
            if new_status then
                target_status[#target_status + 1] = condition
            end
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


function test_start()
    local script_arg = {
        status = {2}
    }
    local func_callback = function(string_rid)
        local status_id, condition
        local can_add_list = {}
        for k, v in pairs(script_arg.status) do
            status_id = v
            condition = {}
            can_add_list[status_id] = condition
        end

        status_apply_status(string_rid, can_add_list)
    end


    local reflect_func_list = defense_info.reflect_func_list or {}
    reflect_func_list["spe8"] = {func_callback}
    defense_info.reflect_func_list = reflect_func_list

    for i = 1, 300 do
        local reflect_func_list = defense_info.reflect_func_list
        for key, v in pairs(reflect_func_list) do
            v[1](defense_info.rid)
        end
    end
end


test_start()

print("----------------------over----------------------------")

