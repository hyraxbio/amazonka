{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TemplateHaskell   #-}
{-# LANGUAGE TypeFamilies      #-}

-- Module      : Network.AWS.IAM.V2010_05_08.GetGroupPolicy
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Retrieves the specified policy document for the specified group. The
-- returned policy is URL-encoded according to RFC 3986. For more information
-- about RFC 3986, go to http://www.faqs.org/rfcs/rfc3986.html.
-- https://iam.amazonaws.com/ ?Action=GetGroupPolicy &GroupName=Admins
-- &PolicyName=AdminRoot &AUTHPARAMS Admins AdminRoot
-- {"Version":"2012-10-17","Statement":[{"Effect":"Allow","Action":"*","Resource":"*"}]}
-- 7a62c49f-347e-4fc4-9331-6e8eEXAMPLE.
module Network.AWS.IAM.V2010_05_08.GetGroupPolicy where

import Control.Lens
import Network.AWS.Request.Query
import Network.AWS.IAM.V2010_05_08.Types
import Network.AWS.Prelude

data GetGroupPolicy = GetGroupPolicy
    { _ggprGroupName :: Text
      -- ^ Name of the group the policy is associated with.
    , _ggprPolicyName :: Text
      -- ^ Name of the policy document to get.
    } deriving (Generic)

makeLenses ''GetGroupPolicy

instance ToQuery GetGroupPolicy where
    toQuery = genericToQuery def

data GetGroupPolicyResponse = GetGroupPolicyResponse
    { _ggpsGroupName :: Text
      -- ^ The group the policy is associated with.
    , _ggpsPolicyDocument :: Text
      -- ^ The policy document.
    , _ggpsPolicyName :: Text
      -- ^ The name of the policy.
    } deriving (Generic)

makeLenses ''GetGroupPolicyResponse

instance FromXML GetGroupPolicyResponse where
    fromXMLOptions = xmlOptions

instance AWSRequest GetGroupPolicy where
    type Sv GetGroupPolicy = IAM
    type Rs GetGroupPolicy = GetGroupPolicyResponse

    request = post "GetGroupPolicy"
    response _ = xmlResponse
