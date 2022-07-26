local rid_objects = {}

local apply_err_flag
local temp_save_status = {}

CAMP_TYPE_ATTACKER = 1
CAMP_TYPE_DEFENSER = 2

attack_user2 = {

    rid = "attack_user2",
    camp = CAMP_TYPE_ATTACKER
}
rid_objects[attack_user2.rid] = attack_user2

defense_user1 = {

    rid = "defense_user1",
    amp = CAMP_TYPE_DEFENSER
}
rid_objects[defense_user1.rid] = defense_user1

attack_info = {

    rid = "attack_rid",
    owner = "attack_user2",
    speciality_id = 28,
    camp = CAMP_TYPE_ATTACKER,
    combat_rid = "combat_template_rid",
    hp = 1000,
    at_pos = 1

}

rid_objects[attack_info.rid] = attack_info

defense_info = {

    rid = "defense_rid",
    owner = "defense_user1",
    speciality_id = 28,
    camp = CAMP_TYPE_DEFENSER,
    combat_rid = "combat_template_rid",
    hp = 1000,
    at_pos = 1
}
rid_objects[defense_info.rid] = defense_info

global_cob = {

    rid = "combat_template_rid",
    at_camp = {
        [CAMP_TYPE_ATTACKER] = {attack_info},
        [CAMP_TYPE_DEFENSER] = {defense_info}
    }
}
rid_objects[global_cob.rid] = global_cob

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


function APPLY_STATUS(source_ob, target_ob, status_list, from, effect_type)

    local status_id, condition
    local can_add_list = {}
    for k, v in pairs(status_list) do
        status_id = v
        condition = {}
        condition.source_rid = source_ob.rid
        can_add_list[status_id] = condition
    end

    status_apply_status(target_ob.rid, can_add_list)
end


function add_reflect_function(source_ob, f, arg)
    local reflect_func_list = source_ob.reflect_func_list or {}
    reflect_func_list["spe8"] = {f, arg}
    source_ob.reflect_func_list = reflect_func_list
end


function run_reflect_function(source_ob, para)
    local reflect_func_list = source_ob.reflect_func_list
    if not reflect_func_list then
        return
    end

    for key, v in pairs(reflect_func_list) do
        v[1](v[2], source_ob, para)
    end
end


function test_start()
    local list = {attack_info, defense_info}

    for _, fighter in ipairs(list) do
        local script_arg = {
            status = {2}
        }
        local func = function(arg, source_ob, para)
            for i = 1, 1000 do
                APPLY_STATUS(source_ob, para.source_ob, script_arg.status)
            end
        end


        add_reflect_function(fighter, func, nil)
    end

    for i = 1, 300 do
        global_cob.sort_rid_list = nil

        local action_list = {}
        local command = {
            action = ACTION_CAST,
            source_rid = attack_info.rid,
            skill_id = 219,
            no_cost = 1
        }
        action_list[#action_list + 1] = command

        for _, command in ipairs(action_list) do
            local action_cnt = 3
            for i = 1, action_cnt do
                local source_rid = attack_info.rid
                local attack_info = rid_objects[source_rid]
                for i = 1, 10 do
                    local para = {
                        source_ob = attack_info,
                        target_ob = defense_info
                    }
                    run_reflect_function(defense_info, para)
                end
            end
        end
    end
end


test_start()

print("----------------------over----------------------------")

