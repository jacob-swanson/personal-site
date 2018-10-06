import * as React from "react";
import {Page} from "../../components/page/Page";
import {FontAwesomeIcon} from "@fortawesome/react-fontawesome";
import {faGithub} from "@fortawesome/free-brands-svg-icons";
import "./PortfolioPage.css";

export const PortfolioPage = () => (
    <Page title="Jacob Swanson - Portfolio" className="PortfolioPage">
        <div className="container">
            <h2 className="subtitle">These are just a few projects that I've worked on in my spare time.</h2>
            <div className="content">
                <h3><a href="/">www.jacob-swanson.com</a></h3>
                <p>
                    <FontAwesomeIcon icon={faGithub} fixedWidth={true}/>
                    <a href="https://github.com/jacob-swanson">jacob-swanson</a> / <a
                    href="https://github.com/jacob-swanson/personal-site">personal-site</a>
                </p>
                <p>
                    I created this site using React, TypeScript, and Bulma. It's hosted via GitHub Pages.
                </p>

                <h3><a href="http://jacob-swanson.github.io/poe4j/">poe4j</a></h3>
                <p>
                    <FontAwesomeIcon icon={faGithub} fixedWidth={true}/>
                    <a href="https://github.com/jacob-swanson">jacob-swanson</a> / <a
                    href="https://github.com/jacob-swanson/poe4j">poe4j</a>
                </p>
                <p>
                    poe4j is a Path of Exile data mining library written in Java.
                    It also includes a <a href="http://jacob-swanson.github.io/poe4j/#/chromatic-calculator"
                                          target="_blank">Chromatic Calculator</a> web app that calculates the most
                    efficient way to spend Chromatic orbs when trying to color an item's sockets.
                </p>

                <h3><a href="http://jacob-swanson.github.io/kerbonaut-naming/" target="_blank">Kerbonaut Naming</a></h3>
                <p>
                    <FontAwesomeIcon icon={faGithub} fixedWidth={true}/>
                    <a href="https://github.com/jacob-swanson">jacob-swanson</a> / <a
                    href="https://github.com/jacob-swanson/kerbonaut-naming">kerbonaut-naming</a>
                </p>
                <p>
                    A JavaScript app that generates Kerbonaut names from the game Kerbal Space Program.
                </p>

                <h3><a href="https://github.com/jacob-swanson/base64-emoji">base64-emoji</a></h3>
                <p>
                    <FontAwesomeIcon icon={faGithub} fixedWidth={true}/>
                    <a href="https://github.com/jacob-swanson">jacob-swanson</a> / <a
                    href="https://github.com/jacob-swanson/base64-emoji">base64-emoji</a>
                </p>
                <p>
                    A JavaScript implementation of Base64 that supports unicode, which is targeted towards emoji.
                </p>
            </div>
        </div>
    </Page>
);