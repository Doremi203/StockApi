﻿FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["src/StockApi/StockApi.csproj", "src/StockApi/"]
RUN dotnet restore "src/StockApi/StockApi.csproj"
COPY . .
WORKDIR "/src/src/StockApi"
RUN dotnet build "StockApi.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "StockApi.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "StockApi.dll"]