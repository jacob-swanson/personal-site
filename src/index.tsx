import * as React from "react";
import {hydrate, render} from "react-dom";
import registerServiceWorker from "./registerServiceWorker";
import {App} from "./App";

const rootElement = document.getElementById("root");
const renderMethod = rootElement && rootElement.hasChildNodes() ? hydrate : render;
renderMethod(<App/>, rootElement);
registerServiceWorker();
