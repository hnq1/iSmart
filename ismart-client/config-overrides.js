const {
    override,
    useBabelRc
} = require("customize-cra");
const path = require("path");
const withMT = require("@material-tailwind/react/utils/withMT");


module.exports = override(
    // enable legacy decorators babel plugin
    useBabelRc()
);
module.exports = withMT({
    content: [],
    theme: {
        extend: {},
    },
    plugins: [],
});