# Excel 2 Json
- Read file excel to json
- Custom mapping with custom columns

# Build
```shell
bash build
```
OR
```shell
make build run
```

# Example
```shell
docker run -v /my/path:/app/data --rm -it cubetiq/node-excel2json
```

```shell
docker run -v /home/sombochea/excel2json:/app/data -e APP_NAME="EXCEL 2 JSON" -e MAPPER_FILE="./data/mapper.json" --rm -it cubetiq/node-excel2json
```

# Mapper Config
```json
{
  "data": [
    {
      "dataIndex": "Name",
      "label": "Name"
    },
    {
      "dataIndex": "Age",
      "label": "Age"
    }
  ],
  "configs": {}
}
```

# Environment
```env
APP_NAME=custom app name
INPUT_FILE=./data/mydata.xlsx
OUTPUT_PATH=./data/outputs
MAPPER_FILE=./data/mapper.json
SHEET_NAME=Sheet1
ENCODING=utf-8
```
