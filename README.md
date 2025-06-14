# Bookshop SQL Server Container

This repository provides a simple setup for running a SQL Server container with a sample `BookShop` database. The container is based on the official Microsoft SQL Server image and automatically loads test data when it starts.

## Local Development

1. **Build the Docker image**
   ```bash
   docker build -t bookshop-sql ./docker
   ```

2. **Run the container**
   ```bash
   docker run -d \
     -p 1433:1433 \
     --name bookshop_sql \
     bookshop-sql
   ```
   The container exposes SQL Server on port `1433` with the `SA` password set to `Your_password123`.

3. **Connect to the database**
   Use any SQL Server client (such as Azure Data Studio) and connect to `localhost,1433` using `SA`/`Your_password123`.

## Deploying to Azure

You can deploy the container to Azure Container Instances (ACI). The following script illustrates a basic deployment using the Azure CLI:

```bash
# Build and push to Azure Container Registry (ACR)
az acr build --registry <ACR_NAME> --image bookshop-sql ./docker

# Create the container instance
az container create \
  --resource-group <RESOURCE_GROUP> \
  --name bookshop-sql \
  --image <ACR_NAME>.azurecr.io/bookshop-sql \
  --cpu 1 --memory 1 \
  --ports 1433 \
  --environment-variables ACCEPT_EULA=Y SA_PASSWORD=Your_password123
```

Replace `<ACR_NAME>` and `<RESOURCE_GROUP>` with your Azure Container Registry and resource group names. After deployment, you can connect to the SQL Server instance using the container's public IP address on port `1433`.
