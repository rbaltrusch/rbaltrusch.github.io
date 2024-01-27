import CleanCSS from "clean-css";
import { readFileSync, writeFileSync } from 'fs';
import {glob} from 'glob';

const minifyCss = (filepath) => {
    const contents = readFileSync(filepath).toString();
    const options = {};
    const output = new CleanCSS(options).minify(contents);
    writeFileSync(filepath.replace(".css", ".min.css"), output.styles)
}

const files = await glob('css/*.css', { ignore: 'css/*.min.css' })
files.forEach(minifyCss)
