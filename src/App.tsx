import * as React from "react";
import {Navbar} from "./components/Navbar";
import {Route, Router, Switch} from "react-router-dom";
import {HomePage} from "./pages/home/HomePage";
import {NotFoundPage} from "./pages/NotFoundPage";
import {Footer} from "./components/Footer";
import "./App.css";
import {ResumePage} from "./pages/resume/ResumePage";
import {PortfolioPage} from "./pages/portfolio/PortfolioPage";
import "bulma/css/bulma.css";
import createHashHistory from "history/createHashHistory";
import * as ReactGA from "react-ga";

ReactGA.initialize("UA-124596010-1", {debug: process.env.NODE_ENV !== "production"});

const history = createHashHistory();
history.listen(location => {
    const path = location.pathname + location.search;
    ReactGA.pageview(path);
});

export const App = () => (
    <Router history={history}>
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
    </Router>
);
