function __is_agent_check
    if test -f "$SSH_AGENT_ENV"
        source "$SSH_AGENT_ENV" > /dev/null
    end

    if test -z "$SSH_AGENT_PID"
        return 1
    end

    ps -ef | grep $SSH_AGENT_PID | grep -v grep | grep -q ssh-agent
    return $status
end

function __start_ssh_agent
    ssh-agent -c | sed 's/^echo/#echo/' | sed 's/^setenv/set -xg/' > $SSH_AGENT_ENV
    source "$SSH_AGENT_ENV" > /dev/null
end

function fish_ssh_agent
    set -xg SSH_AGENT_ENV ~/.ssh/ssh-agent-env
   
    if not test -f "$SSH_AGENT_ENV"
        touch "$SSH_AGENT_ENV"
        chmod 600 "$SSH_AGENT_ENV"
    end

    if not __is_agent_check
        __start_ssh_agent
    end
end
