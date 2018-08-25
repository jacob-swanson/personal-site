import * as React from "react";
import {FontAwesomeIcon} from "@fortawesome/react-fontawesome";
import {faGithub, faLinkedin} from "@fortawesome/free-brands-svg-icons";
import {faEnvelope} from "@fortawesome/free-solid-svg-icons";
import {HiddenLink} from "./HiddenLink";

const year = (new Date()).getFullYear();

export const Footer = () => (
    <footer className="footer has-text-centered">
        <div className="buttons is-centered">
            <a className="button is-rounded"
               href="https://github.com/jacob-swanson">
                <span className="icon"><FontAwesomeIcon icon={faGithub}/></span>
            </a>
            <a className="button is-rounded"
               href="https://www.linkedin.com/in/jacob-swanson-1a1660a3">
                <span className="icon"><FontAwesomeIcon icon={faLinkedin}/></span>
            </a>
            <HiddenLink className="button is-rounded" href="bWFpbHRvOmphY29iQGphY29iLXN3YW5zb24uY29t" decode={true}>
                <span className="icon"><FontAwesomeIcon icon={faEnvelope}/></span>
            </HiddenLink>
        </div>
        <div className="has-text-grey-light">
            Created by Jacob Swanson &copy; {year}
        </div>
    </footer>
);