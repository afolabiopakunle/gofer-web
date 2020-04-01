<%-- 
    Document   : fund-wallet
    Created on : 11-Feb-2020, 03:26:24
    Author     : JOSWAL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<div class="errands-main errands-list">
    <div class="sidebar">
        <div class="side-box ongoing-errands p-3 position-relative">
            <h6 class="font-weight-bold "> Ongoing Errands</h6>
            <div class="scrollbox dragscroll">
                <p class="no-activity ">You currently have no activity running.</p>
                <div class="user-card">
                    <div class="divide split">
                        <p class="posted">You posted</p>
                        <p class="time">2 Hours ago</p>
                    </div>
                    <div class="main-card divide">
                        <img class="profile-picture-inner mr-3" src="./img/idris.jpg" alt="profile-picture">
                        <div class="details divide down">
                            <p class="user-name">
                                Jumoke Adeleke
                            </p>
                            <p class="errand-details">My dog needs a bath, I haven't washed her in months,
                                she's
                                super...</p>
                        </div>
                    </div>
                </div>
                <div class="user-card">
                    <div class="divide split p-0">
                        <p class="you-accepted">You Accepted</p>
                        <p class="time">15 Minutes ago</p>
                    </div>
                    <div class="main-card divide">
                        <img class="profile-picture-inner mr-3" src="./img/idris.jpg" alt="profile-picture">
                        <div class="details divide down">
                            <p class="user-name">
                                Nelson Igwilo
                            </p>
                            <p class="errand-details">My dog needs a bath, I haven't washed her in months,
                                she's
                                super...</p>
                        </div>
                    </div>
                </div>
                <div class="user-card">
                    <div class="divide split p-0">
                        <p class="you-accepted">You Accepted</p>
                        <p class="time">15 Minutes ago</p>
                    </div>
                    <div class="main-card divide">
                        <img class="profile-picture-inner mr-3" src="./img/idris.jpg" alt="profile-picture">
                        <div class="details divide down">
                            <p class="user-name">
                                Nelson Igwilo
                            </p>
                            <p class="errand-details">My dog needs a bath, I haven't washed her in months,
                                she's
                                super...</p>
                        </div>
                    </div>
                </div>
                <div class="user-card">
                    <div class="divide split p-0">
                        <p class="you-accepted">You Accepted</p>
                        <p class="time">15 Minutes ago</p>
                    </div>
                    <div class="main-card divide">
                        <img class="profile-picture-inner mr-3" src="./img/idris.jpg" alt="profile-picture">
                        <div class="details divide down">
                            <p class="user-name">
                                Nelson Igwilo
                            </p>
                            <p class="errand-details">My dog needs a bath, I haven't washed her in months,
                                she's
                                super...</p>
                        </div>
                    </div>
                </div>.
            </div>
        </div>
        <div class="side-box ongoing-bids p-3">
            <h6 class="font-weight-bold">Ongoing Bids</h6>
            <div class="scrollbox dragscroll">
                <p class="no-activity">You currently have no ongoing bids running.</p>
                <div class="user-card">
                    <div class="divide split">
                        <p class="pending">Pending</p>
                    </div>
                    <div class="main-card divide">
                        <img class="profile-picture mr-3" src="./img/dope.jpg" alt="profile-picture">
                        <div class="details divide down">
                            <p class="user-name">
                                Daniel Waters
                            </p>
                            <p class="errand-details">My dog needs a bath, I haven't washed her in months,
                                she's
                                super friendly...</p>
                        </div>
                    </div>
                </div>
                <div class="user-card">
                    <div class="divide split">
                        <p class="accepted">Accepted</p>
                    </div>
                    <div class="main-card divide">
                        <img class="profile-picture mr-3" src="./img/dope.jpg" alt="profile-picture">
                        <div class="details divide down">
                            <p class="user-name">
                                Daniel Waters
                            </p>
                            <p class="errand-details">My dog needs a bath, I haven't washed her in months,
                                she's
                                super friendly...</p>
                        </div>
                    </div>
                </div>
                <div class="user-card">
                    <div class="divide split">
                        <p class="rejected">Rejected</p>
                    </div>
                    <div class="main-card divide">
                        <img class="profile-picture mr-3" src="./img/dope.jpg" alt="profile-picture">
                        <div class="details divide down">
                            <p class="user-name">
                                Daniel Waters
                            </p>
                            <p class="errand-details">My dog needs a bath, I haven't washed her in months,
                                she's
                                super friendly...</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="main-body wallet">

        <div class="withdraw-header">
            <a href="${pageContext.request.contextPath}/ControllerServlet?action=Link&type=Wallet">
                <ol class="breadcrumb breadcrumb-right-arrow" >
                    <li class="breadcrumb-item wallet-trans amount-title"></li>

                    <li class="breadcrumb-item amount-title back-to-wallet">back to wallet</li>
                </ol>
            </a>
        </div>

        <div class="withdraw-text-block">
            <h1 class="withdraw-text">Fund Your Wallet</h1>
        </div>

        <form class="form-block">
            <div class="col-xl-12 col-md-12 wallet-col" style="margin-top: 20px;">
                <div class="section-headline margin-top-25 margin-bottom-12">
                    <h5 class="fund-input-text">Pick Card Type</h5>
                </div>
                <ul class="fund-list">
                    <li class="fund-item">
                        <input type="checkbox" id="myCheckbox1" />
                        <label for="myCheckbox1" class="label-input"><img src="./img/verve logo.png"
                                                                          class="fund-img" /></label>
                    </li>
                    <li class="fund-item">

                        <input type="checkbox" id="myCheckbox2" />
                        <label for="myCheckbox2" class="label-input"><img src="./img/visa logo.png"
                                                                          class="fund-img" /></label>
                    </li>
                    <li class="fund-item">

                        <input type="checkbox" id="myCheckbox3" />
                        <label for="myCheckbox3" class="label-input"><img src="./img/master card.png"
                                                                          class="fund-img" /></label>
                    </li>
                </ul>
            </div>

            <div class="col-xl-12 col-md-12" style="margin-top: 20px;">
                <div class="section-headline margin-top-25 margin-bottom-12">
                    <h5 class="fund-input-text">Card Holders Name </h5>
                </div>
                <input class="input-box input-boxes input-withdraw" placeholder="">
            </div>

            <div class="col-xl-6 col-md-6" style="margin-top: 20px;">
                <div class="section-headline margin-top-25 margin-bottom-12">
                    <h5 class="fund-input-text">Card Number </h5>
                </div>
                <input class="input-box input-boxes input-withdraw" placeholder="">
            </div>


            <div class="btn-input-fund">
                <div class="col-xl-3 col-md-3" style="margin-top: 20px;">
                    <div class="section-headline margin-top-25 margin-bottom-12">
                        <h5 class="fund-input-text">Expiry Date</h5>
                    </div>
                    <input class="input-box input-boxes input-withdraw1" placeholder="0 0 0 0">
                </div>

                <div class="col-xl-3 col-md-3 second-input" style="margin-top: 20px;">
                    <div class="section-headline margin-top-25 margin-bottom-12">
                        <h5 class="fund-input-text">CVV </h5>
                    </div>
                    <input class="input-box input-boxes input-withdraw1" placeholder="0 0 0 0">
                </div>
            </div>

            <div class="radio-block">
                <input type="radio">
                <h1 class="radio-text">Save my details for future Transaction</h1>
            </div>

            <button class="btn-fund">Fund</button>



        </form>
        <!-- Nav tabs -->


        <!-- Tab panes -->





    </div>
</div>
