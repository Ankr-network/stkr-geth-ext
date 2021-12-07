UPSTREAM_REPO="ethereum/go-ethereum"

UPSTREAM_URL="https://github.com/$UPSTREAM_REPO"
git remote get-url upstream &> /dev/null && git remote remove upstream
git remote add upstream $UPSTREAM_URL
git fetch upstream
LATEST_RELEASE_TAG=`curl --silent https://api.github.com/repos/$UPSTREAM_REPO/releases/latest | jq --raw-output .tag_name`
git merge $LATEST_RELEASE_TAG -m "release $LATEST_RELEASE_TAG"
git push origin feature/full-block-api