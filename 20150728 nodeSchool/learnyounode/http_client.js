var http = require("http")

http.get(process.argv[2], processResponse)

function processResponse(res) {
	// res.setEncoding("utf8")
	// res.on("data", console.log)
	// res.on("error", console.error)
  res.setEncoding("utf8")
  console.log('STATUS: ' + res.statusCode);
  res.on("error", console.error);
}