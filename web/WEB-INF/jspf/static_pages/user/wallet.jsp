<%-- 
    Document   : wallet
    Created on : 11-Feb-2020, 03:22:25
    Author     : JOSWAL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="errands-main errands-list ">
    <div class="sidebar">
        <div class="side-box top ongoing-errands p-3 position-relative">
            <h6 class="font-weight-bold "> Ongoing Errands</h6>
            <div class="scrollbox dragscroll">
                <p class="no-activity ">You currently have no activity running.</p>
                <div class="user-card">
                    <div class="divide split">
                        <p class="posted">You posted</p>
                        <p class="time">2 Hours ago</p>
                    </div>
                    <div class="main-card divide">
                        <img class="profile-picture-inner mr-3" src="../images/idris.jpg" alt="profile-picture">
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
                        <img class="profile-picture-inner mr-3" src="../images/idris.jpg" alt="profile-picture">
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
                        <img class="profile-picture-inner mr-3" src="../images/idris.jpg" alt="profile-picture">
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
                        <img class="profile-picture-inner mr-3" src="../images/idris.jpg" alt="profile-picture">
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
        <div class="side-box bottom ongoing-bids p-3">
            <h6 class="font-weight-bold">Ongoing Bids</h6>
            <div class="scrollbox dragscroll">
                <p class="no-activity">You currently have no ongoing bids running.</p>
                <div class="user-card">
                    <div class="divide split">
                        <p class="pending">Pending</p>
                    </div>
                    <div class="main-card divide">
                        <img class="profile-picture mr-3" src="../images/dope.jpg" alt="profile-picture">
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
                        <img class="profile-picture mr-3" src="../images/dope.jpg" alt="profile-picture">
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
                        <img class="profile-picture mr-3" src="../images/dope.jpg" alt="profile-picture">
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

        <div class="container errand">
            <div class="card-columns card-block">
                <div class="card wallet-card-inner">
                    <div class="card-body">
                        <h5 class="amount-title">Total Balance</h5>
                        <p class="amount-text"># 10,200</p>
                        <p class="amount-inner text-red"><small class="muted">escrow</small>&nbsp;+# 3,000</p>
                    </div>
                    <div class="button-wallet">
                        <a href="${pageContext.request.contextPath}/ControllerServlet?action=Link&type=Withdraw"> 
                            <button class="btn-submit-requests" type="">Withdraw</button>
                        </a>
                        <a href="${pageContext.request.contextPath}/ControllerServlet?action=Link&type=Fund"> <button class="btn-reset" type="">Fund Wallet</button></a>
                    </div>
                </div>

                <div class="card wallet-card-inner">
                    <div class="card-body">
                        <h5 class="amount-title">Income</h5>
                        <p class="amount-text mb-4">+$ 6,420</p>
                        <p class="amount-inner text-blue" style="margin-bottom: 05px;"><small
                                class="muted">Completed Errands</small>&nbsp;+$ 4,120</p>
                        <p class="amount-inner text-blue"><small class="muted">Fund Wallet</small> &nbsp;+$
                            2,220</p>
                    </div>
                </div>

                <div class="card">
                    <div class="card-body">
                        <h5 class="amount-title">Expenditure</h5>
                        <p class="amount-text mb-4">-$&nbsp;3,300</p>
                        <p class="amount-inner text-red" style="margin-bottom: 05px;"><small
                                class="muted">Sent
                                Errands &nbsp;</small>+$ 3,000</p>
                        <p class="amount-inner text-red"><small class="muted">Withdrawals
                                &nbsp;</small>+$ 3,000
                        </p>
                    </div>
                </div>
            </div>

            <div class="bottom-card">
                <div class="wallet-text-block">
                    <h1 class="amount-title wallet-text">Wallet Transactions</h1>
                </div>


                <ul class="nav nav-tabs">
                    <li class="wallet-item wallet-item">
                        <a class="wallet-link active" data-toggle="tab" href="#home">All</a>
                    </li>
                    <li class="wallet-item">
                        <a class="wallet-link" data-toggle="tab" href="#menu1">Credit</a>
                    </li>
                    <li class="wallet-item">
                        <a class="wallet-link" data-toggle="tab" href="#menu2">Debit</a>
                    </li>
                    <li class="wallet-item">
                        <a class="wallet-link" data-toggle="tab" href="#menu3">Escrow</a>
                    </li>

                </ul>


                <div class="tab-content">
                    <div id="home" class="container tab-pane active"><br>


                        <div class="user-block user-detail">
                            <div class="user-img">
                                <img src="../images/idris.jpg" class="profile-picture"
                                     alt="profile-pix">&nbsp;<span class="user-wallet-name">Idowu
                                    Aboyade</span>
                            </div>
                            <p class="wallet-payment-text">Payment for Errand</p>
                            <div class="wallet-amt-blue text-red">-$ 3000</div>
                            <div class="wallet-date">12,Jan. '20</div>
                        </div>
                        <hr>
                        <div class="user-block user-detail">
                            <div class="user-img">
                                <img src="../images/idris.jpg" class="profile-picture"
                                     alt="profile-pix">&nbsp;<span class="user-wallet-name">Idowu
                                    Aboyade</span>
                            </div>
                            <p class="wallet-payment-text">Was paid for errand</p>
                            <div class="wallet-amt-blue text-blue">$ 5000</div>
                            <div class="wallet-date">12,Jan. '20</div>
                        </div>
                        <hr>
                        <div class="user-block user-detail">
                            <div class="user-img">
                                <img src="../images/idris.jpg" class="profile-picture"
                                     alt="profile-pix">&nbsp;<span class="user-wallet-name">Idowu
                                    Aboyade</span>
                            </div>
                            <p class="wallet-payment-text">Payment for Errand</p>
                            <div class="wallet-amt-blue text-red">-$ 2000</div>
                            <div class="wallet-date">12,Jan. '20</div>
                        </div>
                        <hr>
                        <div class="user-block user-detail">
                            <div class="user-img">
                                <img src="../images/idris.jpg" class="profile-picture"
                                     alt="profile-pix">&nbsp;<span class="user-wallet-name">Idowu
                                    Aboyade</span>
                            </div>
                            <p class="wallet-payment-text">Withdrawals</p>
                            <div class="wallet-amt-blue text-red">-$ 3000</div>
                            <div class="wallet-date">12,Jan. '20</div>
                        </div>
                        <hr>
                        <div class="user-block user-detail">
                            <div class="user-img">
                                <img src="../images/idris.jpg" class="profile-picture"
                                     alt="profile-pix">&nbsp;<span class="user-wallet-name">Idowu
                                    Aboyade</span>
                            </div>
                            <p class="wallet-payment-text">Payment for Errand</p>
                            <div class="wallet-amt-blue text-red">-$ 5000</div>
                            <div class="wallet-date">12,Jan. '20</div>
                        </div>
                        <hr>
                        <div class="user-block user-detail">
                            <div class="user-img">
                                <img src="../images/idris.jpg" class="profile-picture"
                                     alt="profile-pix">&nbsp;<span class="user-wallet-name">Idowu
                                    Aboyade</span>
                            </div>
                            <p class="wallet-payment-text">Was paid for Errand</p>
                            <div class="wallet-amt-blue text-blue">$ 500</div>
                            <div class="wallet-date">12,Jan. '20</div>
                        </div>
                        <hr>
                        <div class="user-block user-detail">
                            <div class="user-img">
                                <img src="../images/idris.jpg" class="profile-picture"
                                     alt="profile-pix">&nbsp;<span class="user-wallet-name">Idowu
                                    Aboyade</span>
                            </div>
                            <p class="wallet-payment-text">Payment for Errand</p>
                            <div class="wallet-amt-blue text-red">-$ 5000</div>
                            <div class="wallet-date">12,Jan. '20</div>
                        </div>
                        <hr>
                        <div class="user-block user-detail">
                            <div class="user-img">
                                <img src="../images/idris.jpg" class="profile-picture"
                                     alt="profile-pix">&nbsp;<span class="user-wallet-name">Idowu
                                    Aboyade</span>
                            </div>
                            <p class="wallet-payment-text">Funded Wallet</p>
                            <div class="wallet-amt-blue text-blue">$ 5000</div>
                            <div class="wallet-date">12,Jan. '20</div>
                        </div>

                    </div>

                    <div id="menu1" class="container tab-pane fade"><br>


                        <div class="user-block user-detail">
                            <div class="user-img">
                                <img src="../images/idris.jpg" class="profile-picture"
                                     alt="profile-pix">&nbsp;<span class="user-wallet-name">Idowu
                                    Aboyade</span>
                            </div>
                            <p class="wallet-payment-text">Was paid for Errand</p>
                            <div class="wallet-amt-blue text-blue">$ 5000</div>
                            <div class="wallet-date">12,Jan. '20</div>
                        </div>
                        <hr>
                        <div class="user-block user-detail">
                            <div class="user-img">
                                <img src="../images/idris.jpg" class="profile-picture"
                                     alt="profile-pix">&nbsp;<span class="user-wallet-name">Idowu
                                    Aboyade</span>
                            </div>
                            <p class="wallet-payment-text">Was paid for Errand</p>
                            <div class="wallet-amt-blue text-blue">$ 5000</div>
                            <div class="wallet-date">12,Jan. '20</div>
                        </div>
                        <hr>
                        <div class="user-block user-detail">
                            <div class="user-img">
                                <img src="../images/idris.jpg" class="profile-picture"
                                     alt="profile-pix">&nbsp;<span class="user-wallet-name">Idowu
                                    Aboyade</span>
                            </div>
                            <p class="wallet-payment-text">Was paid for Errand</p>
                            <div class="wallet-amt-blue text-blue">$ 5000</div>
                            <div class="wallet-date">12,Jan. '20</div>
                        </div>
                        <hr>
                        <div class="user-block user-detail">
                            <div class="user-img">
                                <img src="../images/idris.jpg" class="profile-picture"
                                     alt="profile-pix">&nbsp;<span class="user-wallet-name">Idowu
                                    Aboyade</span>
                            </div>
                            <p class="wallet-payment-text">Funded Wallet</p>
                            <div class="wallet-amt-blue text-blue">$ 5000</div>
                            <div class="wallet-date">12,Jan. '20</div>
                        </div>

                    </div>

                    <div id="menu2" class="container tab-pane fade"><br>

                        <div class="user-block user-detail">
                            <div class="user-img">
                                <img src="../images/idris.jpg" class="profile-picture"
                                     alt="profile-pix">&nbsp;<span class="user-wallet-name">Idowu
                                    Aboyade</span>
                            </div>
                            <p class="wallet-payment-text">Payment for Errand</p>
                            <div class="wallet-amt-red text-red">-$ 1000</div>
                            <div class="wallet-date">12,Jan. '20</div>
                        </div>
                        <hr>
                        <div class="user-block user-detail">
                            <div class="user-img">
                                <img src="../images/idris.jpg" class="profile-picture"
                                     alt="profile-pix">&nbsp;<span class="user-wallet-name">Idowu
                                    Aboyade</span>
                            </div>
                            <p class="wallet-payment-text">Payment for Errand</p>
                            <div class="wallet-amt-red text-red">-$ 2000</div>
                            <div class="wallet-date">12,Jan. '20</div>
                        </div>
                        <hr>
                        <div class="user-block user-detail">
                            <div class="user-img">
                                <img src="../images/idris.jpg" class="profile-picture"
                                     alt="profile-pix">&nbsp;<span class="user-wallet-name">Idowu
                                    Aboyade</span>
                            </div>
                            <p class="wallet-payment-text">Withdrawals</p>
                            <div class="wallet-amt-red text-red">-$ 2500</div>
                            <div class="wallet-date">12,Jan. '20</div>
                        </div>
                        <hr>
                        <div class="user-block user-detail">
                            <div class="user-img">
                                <img src="../images/idris.jpg" class="profile-picture"
                                     alt="profile-pix">&nbsp;<span class="user-wallet-name">Idowu
                                    Aboyade</span>
                            </div>
                            <p class="wallet-payment-text">Payment for Errand</p>
                            <div class="wallet-amt-red text-red">-$ 1500</div>
                            <div class="wallet-date">12,Jan. '20</div>
                        </div>
                        <hr>
                        <div class="user-block user-detail">
                            <div class="user-img">
                                <img src="../images/idris.jpg" class="profile-picture"
                                     alt="profile-pix">&nbsp;<span class="user-wallet-name">Idowu
                                    Aboyade</span>
                            </div>
                            <p class="wallet-payment-text">Withdrawals</p>
                            <div class="wallet-amt-red text-red">-$ 5430</div>
                            <div class="wallet-date">12,Jan. '20</div>
                        </div>
                        <hr>
                        <div class="user-block user-detail">
                            <div class="user-img">
                                <img src="../images/idris.jpg" class="profile-picture"
                                     alt="profile-pix">&nbsp;<span class="user-wallet-name">Idowu
                                    Aboyade</span>
                            </div>
                            <p class="wallet-payment-text">Payment for Errand</p>
                            <div class="wallet-amt-red text-red">-$ 5230</div>
                            <div class="wallet-date">12,Jan. '20</div>
                        </div>

                    </div>
                    <div id="menu3" class="container tab-pane fade"><br>


                        <div class="user-block user-detail">
                            <div class="user-img">
                                <img src="../images/idris.jpg" class="profile-picture"
                                     alt="profile-pix">&nbsp;<span class="user-wallet-name">Idowu
                                    Aboyade</span>
                            </div>
                            <p class="wallet-payment-text">Payment for Errand</p>
                            <div class="wallet-amt text-red">-$ 3000</div>
                            <div class="wallet-date">12,Jan. '20</div>
                        </div>
                        <hr>
                        <div class="user-block user-detail">
                            <div class="user-img">
                                <img src="../images/idris.jpg" class="profile-picture"
                                     alt="profile-pix">&nbsp;<span class="user-wallet-name">Idowu
                                    Aboyade</span>
                            </div>
                            <p class="wallet-payment-text">Payment for Errand</p>
                            <div class="wallet-amt text-red">-$ 3000</div>
                            <div class="wallet-date">12,Jan. '20</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>