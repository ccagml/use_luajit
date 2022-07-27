local target_status = {}

for for_i = 1, 1000 do
    local apply_id_list = {}
    apply_id_list[2] = {}

    local status_id, new_status
    for k, v in pairs(apply_id_list) do
        status_id = k
        v.status_id = status_id
        new_status = true
        for i, info in ipairs(target_status) do
            if info.status_id == status_id then
                new_status = nil
                break
            else
                print("error--- ", info.status_id == status_id, info.status_id, status_id, for_i)
                assert(not (info.status_id == status_id))
            end
        end
        if new_status then
            target_status[#target_status + 1] = v
        end
    end
end

print("----------------------over----------------------------")

