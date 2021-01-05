#!/usr/bin/env bash
ROOT_DIR=/Users/super/develop/go-crawler-distributed

services="
storage_detail
crawl_detail
crawl_list
crawl_tags
"

cd ${ROOT_DIR}

# 编译service可执行文件
run_service() {
    go run ${ROOT_DIR}/service/douban/$1/main.go
    echo -e "\033[32m启动完成: \033[0m $1"
}

go run ${ROOT_DIR}/service/cache/main.go
echo -e "\033[32m启动完成: \033[0m cache"

# 执行编译service
for service in $services
do
    run_service $service
done

