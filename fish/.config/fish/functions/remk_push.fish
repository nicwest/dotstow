function remk_push --description "Push file to reMarkable"
    set -l file_id
    set -l file_name
    
    for file_name in $argv
        set file_id (uuidgen)
        
        echo "$file_id"
    end
end
