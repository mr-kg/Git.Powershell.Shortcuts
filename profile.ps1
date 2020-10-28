# A quick way to switch to master and pull it
function pom { git checkout master | git pull | git pull origin master }

# A quick way to branch off of the current branch and specify a name
function nb($branch) { git checkout -b $branch }

# A great way to stage all changed files, commit them with a message and push to remote
function push($message)
{
    if ([string]::IsNullOrEmpty($message))
    {
        Write-Output "You must specify a commit message"
    }
    else
    {
        $currentBranch = git rev-parse --abbrev-ref HEAD
        git add . | git commit -m $message | git push origin $currentBranch
    }
}
