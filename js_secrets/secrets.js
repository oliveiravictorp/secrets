const fs = require("fs");

(async function main() {
  const inputFile = process.argv[2];
  const outputFile = process.argv[3];

  let originalText;
  try {
    originalText = await fs.promises.readFile(inputFile, "utf-8");
  } catch (error) {
    console.error("Failed to read file: " + inputFile);
    process.exit(1);
  }

  if (!outputFile) {
    const decryptedText = decrypt(originalText);
    console.log(decryptedText);
    return;
  }

  const encryptedText = encrypt(originalText);

  await fs.promises.writeFile(outputFile, encryptedText, "utf-8");

  console.log("Successfully encrypted");
})();

function encrypt(text) {
  return Buffer.from(text, "utf-8").toString("base64");
}

function decrypt(text) {
  return Buffer.from(text, "base64").toString("utf-8");
}
