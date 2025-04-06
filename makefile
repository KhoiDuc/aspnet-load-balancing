# Makefile

# Mục tiêu: Up các dịch vụ mà không cần Swarm
up:
    docker-compose up -d

# Mục tiêu: Sử dụng Swarm để deploy với scaling
up-swarm:
    docker stack deploy -c docker-compose.yml -c docker-compose.override.yml myapp

# Mục tiêu: Scale dịch vụ 'first-api' lên 3 bản sao
scale:
    docker-compose up --scale first-api=3 -d

# Mục tiêu: Dừng các dịch vụ
down:
    docker-compose down

# Mục tiêu: Xem log của dịch vụ
logs:
    docker-compose logs -f

# Mục tiêu: Xoá tất cả các container và mạng
clean:
    docker-compose down --volumes --remove-orphans
