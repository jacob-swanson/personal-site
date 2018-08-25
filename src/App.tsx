import * as React from "react";
import {Navbar} from "./components/Navbar";
import {HashRouter, Route, Switch} from "react-router-dom";
import {HomePage} from "./pages/home/HomePage";
import {NotFoundPage} from "./pages/NotFoundPage";
import {Footer} from "./components/Footer";
import "./App.css";
import {ResumePage} from "./pages/resume/ResumePage";
import {PortfolioPage} from "./pages/portfolio/PortfolioPage";
import "bulma/css/bulma.css";

export const App = () => (
    <HashRouter>
        <div className="App">
            <Navbar/>
            <Switch>
                <Route path="/" exact={true} component={HomePage}/>
                <Route path="/resume" component={ResumePage}/>
                <Route path="/portfolio" component={PortfolioPage}/>
                <Route component={NotFoundPage}/>
            </Switch>
            <Footer/>
        </div>
    </HashRouter>
);
