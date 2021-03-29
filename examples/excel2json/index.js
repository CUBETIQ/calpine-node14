const XLSX = require("xlsx");
const fs = require("fs");

const NAME = process.env.APP_NAME || "excel2json";
console.log("App Name =>", NAME);

// load from env
const INPUT_FILE = process.env.INPUT_FILE || "./data/people.xlsx";
const OUTPUT_PATH = process.env.OUTPUT_PATH || "./data/outputs";
const MAPPER_FILE = process.env.MAPPER_FILE || "./data/mapper.json";

// get mapper in string
const mapperString = fs.readFileSync(
  MAPPER_FILE,
  { encoding: "utf-8" },
  (err) => {
    if (err) throw err;
    console.log("Load file suceed =>", MAPPER_FILE);
  }
);

// convert mapper from string to json object
const mapperJson = JSON.parse(mapperString);
const columsData = mapperJson.data;

// read workbook from excel file
const wb = XLSX.readFile(INPUT_FILE);
const xlData = XLSX.utils.sheet_to_json(wb.Sheets["Sheet1"]);

// mapping the data from read excel file
const data = xlData.map((row) => {
  var _r = {};

  columsData.map((col) => {
    _r[col.label] = row[col.dataIndex];
  });

  return _r;
});
console.log("Data read from excel and mapped\n", data);

// check directory and create it if not exist
if (!fs.existsSync(OUTPUT_PATH)) {
  fs.mkdirSync(OUTPUT_PATH);
}

// write to file
fs.writeFile(`${OUTPUT_PATH}/people_${new Date().getTime()}.json`, JSON.stringify(data), (err) => {
  if (err) throw err;
  console.log("Write succeed!");
});
