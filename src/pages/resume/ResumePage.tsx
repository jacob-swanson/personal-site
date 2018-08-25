import * as React from "react";
import {Page} from "../../components/page/Page";
import "./ResumePage.css";

export const ResumePage = () => (
    <Page className="ResumePage" title="Jacob Swanson - Resume">
        <div className="container content">
            <h1 className="has-text-centered">Jacob Swanson</h1>

            <h2>Technical Skills</h2>

            <table>
                <thead>
                <tr>
                    <th>Category</th>
                    <th>Proficiency in approximate descending order</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>Programming Languages</td>
                    <td>Java, PHP, TypeScript, JavaScript, Linux shell (Bash), C#, C++</td>
                </tr>
                <tr>
                    <td>Browser Technologies</td>
                    <td>React, HTML, SASS, CSS</td>
                </tr>
                <tr>
                    <td>Other Technologies</td>
                    <td>Spring Boot, Hibernate, Maven, Gradle, Flyway, RegEx, WPF, Qt</td>
                </tr>
                <tr>
                    <td>Data Storage</td>
                    <td>PostgreSQL, MySQL, Redis, Solr, Elasticsearch</td>
                </tr>
                <tr>
                    <td>Tools</td>
                    <td>Git, IntelliJ, Docker, Vagrant, Visual Studio</td>
                </tr>
                </tbody>
            </table>

            <h2>Employment</h2>

            <div className="level">
                <div className="level-left">
                    <div className="level-item has-text-weight-semibold">
                        <a href="https://www.talroo.com">Talroo (Formerly Jobs2Careers)</a>
                    </div>
                </div>
                <div className="level-right">
                    <div className="level-item">
                        April 2017 - Present
                    </div>
                </div>
            </div>
            <div className="level">
                <div className="level-left">
                    <div className="level-item">
                        Software Engineer
                    </div>
                </div>
                <div className="level-right">
                    <div className="level-item">
                        Austin, TX
                    </div>
                </div>
            </div>
            <ul>
                <li>Use PHP, Java, MySQL, and A/B Testing in an Agile environment to develop products which align with
                    business and user needs
                </li>
            </ul>

            <div className="level">
                <div className="level-left">
                    <div className="level-item has-text-weight-semibold">
                        <a href="https://www.geeksandnerds.com/">Geeks and Nerds</a>
                    </div>
                </div>
                <div className="level-right">
                    <div className="level-item">
                        August 2014 - October 2016
                    </div>
                </div>
            </div>
            <div className="level">
                <div className="level-left">
                    <div className="level-item">
                        Software Engineer
                    </div>
                </div>
                <div className="level-right">
                    <div className="level-item">
                        Huntsville, AL
                    </div>
                </div>
            </div>
            <ul>
                <li>Developed high quality and well documented software independently and with small teams using agile
                    development methodologies
                </li>
                <li>Main and full-stack developer for RAGE, a web-based content management system using Spring Boot and
                    Angular for the Redstone Test Center (RTC)
                </li>
                <li>Added Active Directory authentication with smart cards, strict security controls, and flexible
                    metadata collection to RAGE
                </li>
                <li>Configured continuous integration and deployment with GitLab CI and automated code analysis with
                    SonarQube
                </li>
                <li>Provided customer support, bug fixes, and new features for CabuzTime, a timekeeping web application
                    using Java and JSP
                </li>
                <li>Automated the billing and registration processes for CabuzTime using Stripe</li>
                <li>Created a web application for displaying solar panel stats using Spring Boot, Angular, and D3</li>
                <li>Developed RegEx and backend for Acronytor, a Visual Basic application for building acronym lists
                    from Microsoft Word documents
                </li>
                <li>Worked with senior software engineers to provide bug fixes and new features for an aviation testing
                    system in C++ with Qt for RTC
                </li>
            </ul>

            <div className="level">
                <div className="level-left">
                    <div className="level-item has-text-weight-semibold">
                        <a href="https://www.mentor.com/">Mentor Graphics</a>
                    </div>
                </div>
                <div className="level-right">
                    <div className="level-item">
                        January 2013 - August 2013
                    </div>
                </div>
            </div>
            <div className="level">
                <div className="level-left">
                    <div className="level-item">
                        Intern Software Engineer
                    </div>
                </div>
                <div className="level-right">
                    <div className="level-item">
                        Huntsville, AL
                    </div>
                </div>
            </div>
            <ul>
                <li>Worked within a Scrum-based engineering team focused on testing a Java web framework</li>
                <li>Developed unit, integration, and performance tests for the framework</li>
                <li>Responsible for writing internal documentation and monitoring of automated test results</li>
            </ul>

            <div className="level">
                <div className="level-left">
                    <div className="level-item has-text-weight-semibold">
                        <a href="https://www.aamu.edu/">Alabama A&M University</a>
                    </div>
                </div>
                <div className="level-right">
                    <div className="level-item">
                        June 2011 - December 2012
                    </div>
                </div>
            </div>
            <div className="level">
                <div className="level-left">
                    <div className="level-item">
                        Contract Developer
                    </div>
                </div>
                <div className="level-right">
                    <div className="level-item">
                        Huntsville, AL
                    </div>
                </div>
            </div>
            <ul>
                <li>Created Water Wheels, a video game using the Unreal Development Kit that is part of a mobile lab
                    focused on teaching water conservation to children
                </li>
                <li>Created an Arduino-powered audio-visual demonstration that syncs audio and visual cues to
                    demonstrate a rain-capture system
                </li>
            </ul>

            <div className="level">
                <div className="level-left">
                    <div className="level-item has-text-weight-semibold">
                        <a href="https://www.uah.edu/">University of Alabama in Huntsville</a>
                    </div>
                </div>
                <div className="level-right">
                    <div className="level-item">
                        June 2011 - August 2011
                    </div>
                </div>
            </div>
            <div className="level">
                <div className="level-left">
                    <div className="level-item">
                        Student Researcher
                    </div>
                </div>
                <div className="level-right">
                    <div className="level-item">
                        Huntsville, AL
                    </div>
                </div>
            </div>
            <ul>
                <li>Created a proof-of-concept library in C++ to confirm that the Unreal Development Kit could be used
                    as a visualization tool for a Matlab simulation
                </li>
            </ul>

            <h2>Education</h2>
            <div className="level">
                <div className="level-left">
                    <div className="level-item has-text-weight-semibold">
                        Bachelor of Science, Computer Engineering
                    </div>
                </div>
                <div className="level-right">
                    <div className="level-item">
                        December 2014
                    </div>
                </div>
            </div>
            <div className="level">
                <div className="level-left">
                    <div className="level-item">
                        <a href="https://www.uah.edu/">University of Alabama in Huntsville</a>
                    </div>
                </div>
                <div className="level-right">
                    <div className="level-item">
                        Huntsville, AL
                    </div>
                </div>
            </div>
            <hr/>
            References are available upon request.
        </div>
    </Page>
);