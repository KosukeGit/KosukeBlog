#!/bin/sh

COMMENT=$1

if [ -z ${COMMENT} ]; then  # commentのサイズが0であれば真
  echo "Usage: ./deploy.sh [comment statement(required)]"
  exit
fi

rm -rf docs
hugo -d docs

echo kosukeblog.com > docs/CNAME

git add .
git commit -m "$COMMENT"
git push origin master