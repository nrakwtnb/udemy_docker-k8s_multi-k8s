docker build -t nrakwtnb/udemy_docker-k8s_multi-client:$SHA -t nrakwtnb/udemy_docker-k8s_multi-client:latest -f ./client/Dockerfile ./client
docker build -t nrakwtnb/udemy_docker-k8s_multi-server:$SHA -t nrakwtnb/udemy_docker-k8s_multi-server:latest -f ./server/Dockerfile ./server
docker build -t nrakwtnb/udemy_docker-k8s_multi-worker:$SHA -t nrakwtnb/udemy_docker-k8s_multi-worker:latest -f ./worker/Dockerfile ./worker
docker push nrakwtnb/udemy_docker-k8s_multi-client:latest
docker push nrakwtnb/udemy_docker-k8s_multi-server:latest
docker push nrakwtnb/udemy_docker-k8s_multi-worker:latest
docker push nrakwtnb/udemy_docker-k8s_multi-client:$SHA
docker push nrakwtnb/udemy_docker-k8s_multi-server:$SHA
docker push nrakwtnb/udemy_docker-k8s_multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=nrakwtnb/udemy_docker-k8s_multi-server:$SHA
kubectl set image deployments/client-deployment client=nrakwtnb/udemy_docker-k8s_multi-client:$SHA
kubectl set image deployments/worker-deployment worker=nrakwtnb/udemy_docker-k8s_multi-worker:$SHA
