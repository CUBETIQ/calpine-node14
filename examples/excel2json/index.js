const XLSX = require("xlsx");
const fs = require("fs");

const NAME = process.env.APP_NAME || "excel2json";
console.log("App Name =>", NAME);

// load from env
const INPUT_FILE = process.env.INPUT_FILE || "./data/people.xlsx";
const OUTPUT_PATH = process.env.OUTPUT_PATH || "./data/outputs";
const MAPPER_FILE = process.env.MAPPER_FILE || "./data/mapper.json";
const SHEET_NAME = process.env.SHEET_NAME || "Sheet1";
const ENCODING = process.env.ENCODING || "utf-8";

// get mapper in string
var mapperString = undefined;
try {
  mapperString = fs.readFileSync(MAPPER_FILE, { encoding: ENCODING }, (err) => {
    if (err) {
      console.error(err);
    }
    console.log("Load file suceed =>", MAPPER_FILE);
  });
} catch (err) {
  console.error("read file error", err)
}

// convert mapper from string to json object
const mapperJson = mapperString ? JSON.parse(mapperString) : {};
const configs = mapperJson.configs || {};
const columsData = mapperJson.data || undefined;

// read workbook from excel file
const wb = XLSX.readFile(configs.inputFile || INPUT_FILE);
const xlData = XLSX.utils.sheet_to_json(wb.Sheets[configs.sheetName || SHEET_NAME]);

// mapping the data from read excel file
const data = xlData.map((row) => {
  if (columsData == undefined || !columsData) {
    return row;
  }

  var _r = {};

  columsData.map((col) => {
    _r[col.label] = row[col.dataIndex];
  });

  return _r;
});
console.log("Data read from excel and mapped\n", data);

// parse a new path
const outputPath = configs.outputPath || OUTPUT_PATH

// check directory and create it if not exist
if (!fs.existsSync(outputPath)) {
  fs.mkdirSync(outputPath, { recursive: true });
}

// write to file
fs.writeFileSync(
  `${outputPath}/${configs.outputName || 'exported'}_${new Date().getTime()}.json`,
  JSON.stringify(data),
  (err) => {
    if (err) throw err;
    console.log("Write succeed!");
  }
);
