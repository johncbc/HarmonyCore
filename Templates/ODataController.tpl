<CODEGEN_FILENAME><StructurePlural>Controller.dbl</CODEGEN_FILENAME>
<REQUIRES_CODEGEN_VERSION>5.4.3</REQUIRES_CODEGEN_VERSION>
<REQUIRES_USERTOKEN>MODELS_NAMESPACE</REQUIRES_USERTOKEN>
<REQUIRES_USERTOKEN>SERVICES_NAMESPACE</REQUIRES_USERTOKEN>
<REQUIRES_USERTOKEN>API_ENABLE_QUERY_PARAMS</REQUIRES_USERTOKEN>
;//****************************************************************************
;//
;// Title:       ODataController.tpl
;//
;// Type:        CodeGen Template
;//
;// Description: Used to create OData Controllers in a Harmony Core environment
;//
;// Copyright (c) 2018, Synergex International, Inc. All rights reserved.
;//
;// Redistribution and use in source and binary forms, with or without
;// modification, are permitted provided that the following conditions are met:
;//
;// * Redistributions of source code must retain the above copyright notice,
;//   this list of conditions and the following disclaimer.
;//
;// * Redistributions in binary form must reproduce the above copyright notice,
;//   this list of conditions and the following disclaimer in the documentation
;//   and/or other materials provided with the distribution.
;//
;// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
;// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
;// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
;// ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
;// LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
;// CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
;// SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
;// INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
;// CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
;// ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
;// POSSIBILITY OF SUCH DAMAGE.
;//
;;*****************************************************************************
;;
;; Title:       <StructurePlural>Controller.dbl
;;
;; Description: OData controller for the <STRUCTURE_NOALIAS> structure.
;;
;;*****************************************************************************
;; WARNING: GENERATED CODE!
;; This file was generated by CodeGen. Avoid editing the file if possible.
;; Any changes you make will be lost of the file is re-generated.
;;*****************************************************************************

<IF DEFINED_ENABLE_AUTHENTICATION>
import Microsoft.AspNetCore.Authorization
</IF DEFINED_ENABLE_AUTHENTICATION>
import Microsoft.AspNetCore.JsonPatch
import Microsoft.AspNetCore.Mvc
import Microsoft.AspNet.OData
import Microsoft.AspNet.OData.Routing
import Microsoft.EntityFrameworkCore
import Microsoft.EntityFrameworkCore.Infrastructure
import Microsoft.Extensions.Options
import System.ComponentModel.DataAnnotations
import Harmony.Core.EF.Extensions
import Harmony.Core.Interface
import Harmony.OData
import Newtonsoft.Json
import <MODELS_NAMESPACE>

namespace <NAMESPACE>

<IF DEFINED_ENABLE_AUTHENTICATION>
    {Authorize}
</IF DEFINED_ENABLE_AUTHENTICATION>
<IF DEFINED_ENABLE_API_VERSIONING>
    {ApiVersion("<API_VERSION>")}
</IF DEFINED_ENABLE_API_VERSIONING>
    ;;; <summary>
    ;;; OData controller for <StructurePlural>
    ;;; </summary>
    public partial class <StructurePlural>Controller extends ODataController
    
        ;;Services provided via dependency injection
        private _DbContext, @<MODELS_NAMESPACE>.DBContext
        private _ServiceProvider, @IServiceProvider
        private _AppSettings, @IOptions<AppSettings>

        ;;; <summary>
        ;;; Constructs a new instance of <StructurePlural>Controller
        ;;; </summary>
        ;;; <param name="aDbContext">Database context instance (DI)</param>
        ;;; <param name="aServiceProvider">Service provider instance (DI)</param>
        ;;; <param name="aAppSettings">Application settings</param>
        public method <StructurePlural>Controller
            aDbContext, @<MODELS_NAMESPACE>.DBContext
            aServiceProvider, @IServiceProvider
            aAppSettings, @IOptions<AppSettings>
        proc
            this._DbContext = aDbContext
            this._ServiceProvider = aServiceProvider
            this._AppSettings = aAppSettings
        endmethod

;//
;// GET ALL -------------------------------------------------------------------
;//
<IF DEFINED_ENABLE_GET_ALL>
<IF GET_ALL_ENDPOINT>
        {ODataRoute("<StructurePlural>")}
  <IF DEFINED_ENABLE_AUTHENTICATION>
    <IF USERTOKEN_ROLES_GET>
        {Authorize(Roles="<ROLES_GET>")}
    </IF USERTOKEN_ROLES_GET>
  </IF DEFINED_ENABLE_AUTHENTICATION>
  <IF DEFINED_ENABLE_FIELD_SECURITY>
        {HarmonyFieldSecurity<API_ENABLE_QUERY_PARAMS>}
  <ELSE>
        {EnableQuery<API_ENABLE_QUERY_PARAMS>}
  </IF DEFINED_ENABLE_FIELD_SECURITY>
        ;;; <summary>
        ;;; Get all <StructurePlural>
        ;;; </summary>
        ;;; <returns>Returns an IActionResult indicating the status of the operation and containing any data that was returned.</returns>
        public method Get<StructurePlural>, @IActionResult
        proc
            mreturn Ok(_DbContext.<StructurePlural>.AsNoTracking())
        endmethod

</IF GET_ALL_ENDPOINT>
</IF DEFINED_ENABLE_GET_ALL>
;//
;// GET ONE (PRIMARY KEY READ) ------------------------------------------------
;//
<IF DEFINED_ENABLE_GET_ONE>
<IF GET_ENDPOINT>
        {ODataRoute("<StructurePlural>(<IF STRUCTURE_ISAM><PRIMARY_KEY><SEGMENT_LOOP><IF SEG_TAG_EQUAL><ELSE><FieldSqlName>={a<FieldSqlName>}<,></IF SEG_TAG_EQUAL></SEGMENT_LOOP></PRIMARY_KEY></IF STRUCTURE_ISAM><IF STRUCTURE_RELATIVE>aRecordNumber</IF STRUCTURE_RELATIVE>)")}
  <IF DEFINED_ENABLE_AUTHENTICATION>
    <IF USERTOKEN_ROLES_GET>
        {Authorize(Roles="<ROLES_GET>")}
    </IF USERTOKEN_ROLES_GET>
  </IF DEFINED_ENABLE_AUTHENTICATION>
  <IF DEFINED_ENABLE_FIELD_SECURITY>
        {HarmonyFieldSecurity<API_ENABLE_QUERY_PARAMS>}
  <ELSE>
        {EnableQuery<API_ENABLE_QUERY_PARAMS>}
  </IF DEFINED_ENABLE_FIELD_SECURITY>
        ;;; <summary>
        ;;; Get a single <StructureNoplural> by primary key.
        ;;; </summary>
<IF STRUCTURE_ISAM>
  <PRIMARY_KEY>
    <SEGMENT_LOOP>
      <IF SEG_TAG_EQUAL>
      <ELSE>
        ;;; <param name="a<FieldSqlName>"><FIELD_DESC></param>
      </IF SEG_TAG_EQUAL>
    </SEGMENT_LOOP>
  </PRIMARY_KEY>
</IF STRUCTURE_ISAM>
<IF STRUCTURE_RELATIVE>
        ;;; <param name="aRecordNumber">Record number</param>
</IF STRUCTURE_RELATIVE>
        ;;; <returns>Returns a SingleResult indicating the status of the operation and containing any data that was returned.</returns>
        public method Get<StructureNoplural>, @SingleResult<<StructureNoplural>>
<IF STRUCTURE_ISAM>
  <PRIMARY_KEY>
    <SEGMENT_LOOP>
      <IF SEG_TAG_EQUAL>
      <ELSE>
            {FromODataUri}
            <IF CUSTOM_HARMONY_AS_STRING>
            required in a<FieldSqlName>, string
            <ELSE>
            required in a<FieldSqlName>, <SEGMENT_SNTYPE>
            </IF CUSTOM_HARMONY_AS_STRING>
      </IF SEG_TAG_EQUAL>
    </SEGMENT_LOOP>
  </PRIMARY_KEY>
</IF STRUCTURE_ISAM>
<IF STRUCTURE_RELATIVE>
            {FromODataUri}
            required in aRecordNumber, int
</IF STRUCTURE_RELATIVE>
        proc
;//Shouldn't really need the generic type arg on FindQuery. Compiler issue?
            mreturn new SingleResult<<StructureNoplural>>(_DbContext.<StructurePlural>.AsNoTracking().FindQuery<<StructureNoplural>>(_DbContext, <IF STRUCTURE_ISAM><PRIMARY_KEY><SEGMENT_LOOP><IF SEG_TAG_EQUAL><SEGMENT_TAG_VALUE><ELSE>a<FieldSqlName><IF ALPHA>.PadRight(<FIELD_SIZE>)</IF ALPHA></IF SEG_TAG_EQUAL><,></SEGMENT_LOOP></PRIMARY_KEY></IF STRUCTURE_ISAM><IF STRUCTURE_RELATIVE>aRecordNumber</IF STRUCTURE_RELATIVE>))
        endmethod

</IF GET_ENDPOINT>
</IF DEFINED_ENABLE_GET_ONE>
;//
;// GET BY ALTERNATE KEY ------------------------------------------------------
;//
<IF STRUCTURE_ISAM>
  <IF DEFINED_ENABLE_ALTERNATE_KEYS>
  <IF ALTERNATE_KEY_ENDPOINTS>
    <ALTERNATE_KEY_LOOP>
      <IF DUPLICATES>
        {ODataRoute("<StructurePlural>(<SEGMENT_LOOP><IF SEG_TAG_EQUAL><ELSE><FieldSqlName>={a<FieldSqlName>}<,></IF SEG_TAG_EQUAL></SEGMENT_LOOP>)")}
        <IF DEFINED_ENABLE_AUTHENTICATION>
          <IF USERTOKEN_ROLES_GET>
        {Authorize(Roles="<ROLES_GET>")}
          </IF USERTOKEN_ROLES_GET>
        </IF DEFINED_ENABLE_AUTHENTICATION>
        <IF DEFINED_ENABLE_FIELD_SECURITY>
        {HarmonyFieldSecurity<API_ENABLE_QUERY_PARAMS>}
        <ELSE>
        {EnableQuery<API_ENABLE_QUERY_PARAMS>}
        </IF DEFINED_ENABLE_FIELD_SECURITY>
        ;;; <summary>
        ;;; Get <structurePlural> by alternate key key <KeyName>.
        ;;; </summary>
        <SEGMENT_LOOP>
        <IF SEG_TAG_EQUAL>
        <ELSE>
        ;;; <param name="a<FieldSqlName>"><FIELD_DESC></param>
        </IF SEG_TAG_EQUAL>
        </SEGMENT_LOOP>
        ;;; <returns>Returns an IActionResult indicating the status of the operation and containing any data that was returned.</returns>
        public method Get<StructurePlural>By<KeyName>, @IActionResult
            <SEGMENT_LOOP>
            <IF SEG_TAG_EQUAL>
            <ELSE>
            {FromODataUri}
            <IF CUSTOM_HARMONY_AS_STRING>
            required in a<FieldSqlName>, string
            <ELSE>
            required in a<FieldSqlName>, <SEGMENT_SNTYPE>
            </IF CUSTOM_HARMONY_AS_STRING>
            </IF SEG_TAG_EQUAL>
            </SEGMENT_LOOP>
        proc
            data result = _DbContext.<StructurePlural>.AsNoTracking().FindAlternate(<SEGMENT_LOOP>"<FieldSqlName>",<IF SEG_TAG_EQUAL><SEGMENT_TAG_VALUE><ELSE>a<FieldSqlName></IF SEG_TAG_EQUAL><,></SEGMENT_LOOP>)
            if (result == ^null)
                mreturn NotFound()
            mreturn Ok(result)
        endmethod
      <ELSE>
        {ODataRoute("<StructurePlural>(<SEGMENT_LOOP><IF SEG_TAG_EQUAL><ELSE><FieldSqlName>={a<FieldSqlName>}<,></IF SEG_TAG_EQUAL></SEGMENT_LOOP>)")}
        <IF DEFINED_ENABLE_AUTHENTICATION>
          <IF USERTOKEN_ROLES_GET>
        {Authorize(Roles="<ROLES_GET>")}
          </IF USERTOKEN_ROLES_GET>
        </IF DEFINED_ENABLE_AUTHENTICATION>
        <IF DEFINED_ENABLE_FIELD_SECURITY>
        {HarmonyFieldSecurity<API_ENABLE_QUERY_PARAMS>}
        <ELSE>
        {EnableQuery<API_ENABLE_QUERY_PARAMS>}
        </IF DEFINED_ENABLE_FIELD_SECURITY>
        ;;; <summary>
        ;;; Get <structureNoplural> by alternate key <KeyName>.
        ;;; </summary>
        <SEGMENT_LOOP>
        <IF SEG_TAG_EQUAL>
        <ELSE>
        ;;; <param name="a<FieldSqlName>"><FIELD_DESC></param>
        </IF SEG_TAG_EQUAL>
        </SEGMENT_LOOP>
        ;;; <returns>Returns a SingleResult indicating the status of the operation and containing any data that was returned.</returns>
        public method Get<StructureNoplural>By<KeyName>, @SingleResult<<StructureNoplural>>
            <SEGMENT_LOOP>
            <IF SEG_TAG_EQUAL>
            <ELSE>
            {FromODataUri}
            <IF CUSTOM_HARMONY_AS_STRING>
            required in a<FieldSqlName>, string
            <ELSE>
            required in a<FieldSqlName>, <SEGMENT_SNTYPE>
            </IF CUSTOM_HARMONY_AS_STRING>
            </IF SEG_TAG_EQUAL>
            </SEGMENT_LOOP>
        proc
            mreturn new SingleResult<<StructureNoplural>>(_DbContext.<StructurePlural>.AsNoTracking().FindAlternate(<SEGMENT_LOOP>"<FieldSqlName>",<IF SEG_TAG_EQUAL><SEGMENT_TAG_VALUE><ELSE>a<FieldSqlName><IF ALPHA>.PadRight(<FIELD_SIZE>)</IF ALPHA></IF SEG_TAG_EQUAL><,></SEGMENT_LOOP>))
        endmethod
      </IF DUPLICATES>

    </ALTERNATE_KEY_LOOP>
  </IF ALTERNATE_KEY_ENDPOINTS>
  </IF DEFINED_ENABLE_ALTERNATE_KEYS>
</IF STRUCTURE_ISAM>
;//
;// GET INDIVIDUAL PROPERTIES -------------------------------------------------
;//
<IF DEFINED_ENABLE_PROPERTY_ENDPOINTS>
<IF PROPERTY_ENDPOINTS>
;//
;// In order for the $value function to work in conjunction with these properties,
;// the name of a single key segment MUST be "key"!!! Likely doesn't work with segmented keys.
;//
  <FIELD_LOOP>
    <IF USER>
    <ELSE>
    <IF CUSTOM_NOT_HARMONY_EXCLUDE>
      <IF STRUCTURE_ISAM>
        <IF NOTPKSEGMENT>
        <PRIMARY_KEY>
        {ODataRoute("<StructurePlural>(<IF SINGLE_SEGMENT>{key}<ELSE><SEGMENT_LOOP><IF SEG_TAG_EQUAL><ELSE><FieldSqlName>={a<FieldSqlName>}<,></IF SEG_TAG_EQUAL></SEGMENT_LOOP></IF SINGLE_SEGMENT>)/<FieldSqlName>")}
        <IF DEFINED_ENABLE_AUTHENTICATION>
          <IF USERTOKEN_ROLES_GET>
        {Authorize(Roles="<ROLES_GET>")}
          </IF USERTOKEN_ROLES_GET>
        </IF DEFINED_ENABLE_AUTHENTICATION>
        ;;; <summary>
        ;;; Get the <FieldSqlName> property of a single <StructureNoplural>, by primary key.
        ;;; </summary>
        <IF SINGLE_SEGMENT>
        ;;; <param name="key"><FIELD_DESC></param>
        <ELSE>
        <SEGMENT_LOOP>
          <IF SEG_TAG_EQUAL>
          <ELSE>
        ;;; <param name="a<FieldSqlName>"><FIELD_DESC></param>
          </IF SEG_TAG_EQUAL>
        </SEGMENT_LOOP>
        </IF SINGLE_SEGMENT>
        ;;; <returns>
        ;;; Returns <IF ALPHA>a string</IF ALPHA><IF DECIMAL><IF PRECISION>a decimal<ELSE><IF CUSTOM_HARMONY_AS_STRING>a string<ELSE>an int</IF CUSTOM_HARMONY_AS_STRING></IF PRECISION></IF DECIMAL><IF DATE>a DateTime</IF DATE><IF TIME>a DateTime</IF TIME><IF INTEGER>an int</IF INTEGER> containing the value of the requested property.
        ;;;</returns>
        public method Get<FieldSqlName>, @IActionResult
        <SEGMENT_LOOP>
            <IF SINGLE_SEGMENT>
            {FromODataUri}
            <IF CUSTOM_HARMONY_AS_STRING>
            required in key, string
            <ELSE>
            required in key, <SEGMENT_SNTYPE>
            </IF CUSTOM_HARMONY_AS_STRING>
            <ELSE>
              <IF SEG_TAG_EQUAL>
              <ELSE>
            {FromODataUri}
            <IF CUSTOM_HARMONY_AS_STRING>
            required in a<FieldSqlName>, string
            <ELSE>
            required in a<FieldSqlName>, <SEGMENT_SNTYPE>
            </IF CUSTOM_HARMONY_AS_STRING>
              </IF SEG_TAG_EQUAL>
            </IF SINGLE_SEGMENT>
        </SEGMENT_LOOP>
        proc
            data result = _DbContext.<StructurePlural>.Find(<IF SINGLE_SEGMENT>key<ELSE><SEGMENT_LOOP><IF SEG_TAG_EQUAL><SEGMENT_TAG_VALUE><ELSE>a<FieldSqlName><IF ALPHA>.PadRight(<FIELD_SIZE>)</IF ALPHA></IF SEG_TAG_EQUAL><,></SEGMENT_LOOP></IF SINGLE_SEGMENT>)
            if (result==^null)
                mreturn NotFound()
            mreturn OK(result.<FieldSqlName>)
        endmethod
        </PRIMARY_KEY>
        </IF NOTPKSEGMENT>
      </IF STRUCTURE_ISAM>
      <IF STRUCTURE_RELATIVE>
        {ODataRoute("<StructurePlural>({key})}
        <IF DEFINED_ENABLE_AUTHENTICATION>
          <IF USERTOKEN_ROLES_GET>
        {Authorize(Roles="<ROLES_GET>")}
          </IF USERTOKEN_ROLES_GET>
        </IF DEFINED_ENABLE_AUTHENTICATION>
        ;;; <summary>
        ;;; Get the <FieldSqlName> property of a single <StructureNoplural>, by record number.
        ;;; </summary>
        ;;; <param name="key">Record number</param>
        ;;; <returns>
        ;;; Returns <IF ALPHA>a string</IF ALPHA><IF DECIMAL><IF PRECISION>a decimal<ELSE><IF CUSTOM_HARMONY_AS_STRING>a string<ELSE>an int</IF CUSTOM_HARMONY_AS_STRING></IF PRECISION></IF DECIMAL><IF DATE>a DateTime</IF DATE><IF TIME>a DateTime</IF TIME><IF INTEGER>an int</IF INTEGER> containing the value of the requested property.
        ;;;</returns>
        public method Get<FieldSqlName>, @IActionResult
            {FromODataUri}
            required in key, int
        proc
            data result = _DbContext.<StructurePlural>.Find(key)
            if (result==^null)
                mreturn NotFound()
            mreturn OK(result.<FieldSqlName>)
        endmethod
      </IF STRUCTURE_RELATIVE>

    </IF CUSTOM_NOT_HARMONY_EXCLUDE>
    </IF USER>
  </FIELD_LOOP>
</IF PROPERTY_ENDPOINTS>
</IF DEFINED_ENABLE_PROPERTY_ENDPOINTS>
;//
;// POST ----------------------------------------------------------------------
;//
<IF DEFINED_ENABLE_POST>
<IF POST_ENDPOINT>
  <IF DEFINED_ENABLE_AUTHENTICATION>
    <IF USERTOKEN_ROLES_POST>
        {Authorize(Roles="<ROLES_POST>")}
    </IF USERTOKEN_ROLES_POST>
  </IF DEFINED_ENABLE_AUTHENTICATION>
        {ODataRoute("<StructurePlural>")}
        ;;; <summary>
        ;;; Create a new <structureNoplural> (automatically assigned primary key).
        ;;; </summary>
        ;;; <returns>Returns an IActionResult indicating the status of the operation and containing any data that was returned.</returns>
        public method Post<StructureNoplural>, @IActionResult
            {FromBody}
            required in a<StructureNoplural>, @<StructureNoplural>
        proc
            ;;Remove the primary key fields from ModelState
  <IF STRUCTURE_ISAM>
    <PRIMARY_KEY>
      <SEGMENT_LOOP>
            ModelState.Remove("<FieldSqlName>")
      </SEGMENT_LOOP>
    </PRIMARY_KEY>
  </IF STRUCTURE_ISAM>
  <IF STRUCTURE_RELATIVE>
            ModelState.Remove("RecordNumber")
  </IF STRUCTURE_RELATIVE>

            ;; Validate inbound data
            if (!ModelState.IsValid)
                mreturn BadRequest(ModelState)

            ;;Get the next available primary key value
            disposable data keyFactory = (@IPrimaryKeyFactory)_ServiceProvider.GetService(^typeof(IPrimaryKeyFactory))
            KeyFactory.AssignPrimaryKey(a<StructureNoplural>)

            ;;Add the new <structureNoplural>
            try
            begin
                _DbContext.<StructurePlural>.Add(a<StructureNoplural>)
                _DbContext.SaveChanges(keyFactory)
            end
            catch (e, @ValidationException)
            begin
                ModelState.AddModelError("RelationValidation",e.Message)
                mreturn BadRequest(ModelState)
            end
            endtry

            mreturn Created(a<StructureNoplural>)

        endmethod

</IF POST_ENDPOINT>
</IF DEFINED_ENABLE_POST>
;//
;// PUT -----------------------------------------------------------------------
;//
<IF DEFINED_ENABLE_PUT>
<IF PUT_ENDPOINT>
  <IF DEFINED_ENABLE_AUTHENTICATION>
    <IF USERTOKEN_ROLES_PUT>
        {Authorize(Roles="<ROLES_PUT>")}
    </IF USERTOKEN_ROLES_PUT>
  </IF DEFINED_ENABLE_AUTHENTICATION>
        {ODataRoute("<StructurePlural>(<IF STRUCTURE_ISAM><PRIMARY_KEY><SEGMENT_LOOP><IF SEG_TAG_EQUAL><ELSE><FieldSqlName>={a<FieldSqlName>}<,></IF SEG_TAG_EQUAL></SEGMENT_LOOP></PRIMARY_KEY></IF STRUCTURE_ISAM><IF STRUCTURE_RELATIVE>aRecordNumber</IF STRUCTURE_RELATIVE>)")}
        ;;; <summary>
        ;;; Create (with a client-supplied primary key) or replace a <structureNoplural>.
        ;;; </summary>
  <IF STRUCTURE_ISAM>
    <PRIMARY_KEY>
      <SEGMENT_LOOP>
        <IF SEG_TAG_EQUAL>
        <ELSE>
        ;;; <param name="a<FieldSqlName>"><FIELD_DESC></param>
        </IF SEG_TAG_EQUAL>
      </SEGMENT_LOOP>
    </PRIMARY_KEY>
  </IF STRUCTURE_ISAM>
  <IF STRUCTURE_RELATIVE>
        ;;; <param name="aRecordNumber">Record number</param>
  </IF STRUCTURE_RELATIVE>
        ;;; <returns>Returns an IActionResult indicating the status of the operation and containing any data that was returned.</returns>
        public method Put<StructureNoplural>, @IActionResult
  <IF STRUCTURE_ISAM>
    <PRIMARY_KEY>
      <SEGMENT_LOOP>
        <IF SEG_TAG_EQUAL>
        <ELSE>
            {FromODataUri}
        <IF CUSTOM_HARMONY_AS_STRING>
            required in a<FieldSqlName>, string
        <ELSE>
            required in a<FieldSqlName>, <SEGMENT_SNTYPE>
        </IF CUSTOM_HARMONY_AS_STRING>
        </IF SEG_TAG_EQUAL>
      </SEGMENT_LOOP>
    </PRIMARY_KEY>
  </IF STRUCTURE_ISAM>
  <IF STRUCTURE_RELATIVE>
            {FromODataUri}
            required in aRecordNumber, int
  </IF STRUCTURE_RELATIVE>
            {FromBody}
            required in a<StructureNoplural>, @<StructureNoplural>
        proc
            ;; Validate inbound data
            if (!ModelState.IsValid)
                mreturn BadRequest(ModelState)

            ;;Ensure that the key values in the URI win over any data that may be in the model object
  <IF STRUCTURE_ISAM>
    <PRIMARY_KEY>
      <SEGMENT_LOOP>
        <IF SEG_TAG_EQUAL>
            a<StructureNoplural>.<FieldSqlname> = <SEGMENT_TAG_VALUE>
        <ELSE>
            a<StructureNoplural>.<FieldSqlname> = a<FieldSqlName>
        </IF SEG_TAG_EQUAL>
      </SEGMENT_LOOP>
    </PRIMARY_KEY>
  </IF STRUCTURE_ISAM>
  <IF STRUCTURE_RELATIVE>
            a<StructureNoplural>.RecordNumber = aRecordNumber
  </IF STRUCTURE_RELATIVE>

            try
            begin
                ;;Add and commit
                data existing = _DbContext.<StructurePlural>.Find(<IF STRUCTURE_ISAM><PRIMARY_KEY><SEGMENT_LOOP><IF SEG_TAG_EQUAL><SEGMENT_TAG_VALUE><ELSE>a<FieldSqlName><IF ALPHA>.PadRight(<FIELD_SIZE>)</IF ALPHA></IF SEG_TAG_EQUAL><,></SEGMENT_LOOP></PRIMARY_KEY></IF STRUCTURE_ISAM><IF STRUCTURE_RELATIVE>aRecordNumber</IF STRUCTURE_RELATIVE>)
                if(existing == ^null) then
                begin
                    _DbContext.<StructurePlural>.Add(a<StructureNoplural>)
                    _DbContext.SaveChanges()
                    mreturn Created(a<StructureNoplural>)
                end
                else
                begin
                    a<StructureNoplural>.CopyTo(existing)
                    _DbContext.SaveChanges()
                    mreturn NoContent()
                end
            end
            catch (e, @InvalidOperationException)
            begin
                mreturn BadRequest(e)
            end
            catch (e, @ValidationException)
            begin
                ModelState.AddModelError("RelationValidation",e.Message)
                mreturn BadRequest(ModelState)
            end
            endtry

        endmethod

</IF PUT_ENDPOINT>
</IF DEFINED_ENABLE_PUT>
;//
;// PATCH ---------------------------------------------------------------------
;//
<IF DEFINED_ENABLE_PATCH>
<IF PATCH_ENDPOINT>
  <IF DEFINED_ENABLE_AUTHENTICATION>
    <IF USERTOKEN_ROLES_PATCH>
        {Authorize(Roles="<ROLES_PATCH>")}
    </IF USERTOKEN_ROLES_PATCH>
  </IF DEFINED_ENABLE_AUTHENTICATION>
        {ODataRoute("<StructurePlural>(<IF STRUCTURE_ISAM><PRIMARY_KEY><SEGMENT_LOOP><IF SEG_TAG_EQUAL><ELSE><FieldSqlName>={a<FieldSqlName>}<,></IF SEG_TAG_EQUAL></SEGMENT_LOOP></PRIMARY_KEY></IF STRUCTURE_ISAM><IF STRUCTURE_RELATIVE>RecordNumber={aRecordNumber}</IF STRUCTURE_RELATIVE>)")}
        ;;; <summary>
        ;;; Patch  (partial update) a <structureNoplural>.
        ;;; </summary>
  <IF STRUCTURE_ISAM>
    <PRIMARY_KEY>
      <SEGMENT_LOOP>
        <IF SEG_TAG_EQUAL>
        <ELSE>
        ;;; <param name="a<FieldSqlName>"><FIELD_DESC></param>
        </IF SEG_TAG_EQUAL>
      </SEGMENT_LOOP>
    </PRIMARY_KEY>
  </IF STRUCTURE_ISAM>
  <IF STRUCTURE_RELATIVE>
        ;;; <param name="aRecordNumber">Record number</param>
  </IF STRUCTURE_RELATIVE>
        ;;; <returns>Returns an IActionResult indicating the status of the operation and containing any data that was returned.</returns>
        public method Patch<StructureNoplural>, @IActionResult
  <IF STRUCTURE_ISAM>
    <PRIMARY_KEY>
      <SEGMENT_LOOP>
        <IF SEG_TAG_EQUAL>
        <ELSE>
            {FromODataUri}
          <IF CUSTOM_HARMONY_AS_STRING>
            required in a<FieldSqlName>, string
          <ELSE>
            required in a<FieldSqlName>, <SEGMENT_SNTYPE>
          </IF CUSTOM_HARMONY_AS_STRING>
        </IF SEG_TAG_EQUAL>
      </SEGMENT_LOOP>
    </PRIMARY_KEY>
  </IF STRUCTURE_ISAM>
  <IF STRUCTURE_RELATIVE>
            {FromODataUri}
            required in aRecordNumber, int
  </IF STRUCTURE_RELATIVE>
            {FromBody}
            required in a<StructureNoplural>, @JsonPatchDocument<<StructureNoplural>>
        proc
            ;; Validate inbound data
            if (!ModelState.IsValid)
                mreturn BadRequest(ModelState)

            ;;Patch the existing <structureNoplural>
            try
            begin
                ;;Get the <structureNoplural> to be updated
                data <structureNoplural>ToUpdate = _DbContext.<StructurePlural>.Find(<IF STRUCTURE_ISAM><PRIMARY_KEY><SEGMENT_LOOP><IF SEG_TAG_EQUAL><SEGMENT_TAG_VALUE><ELSE>a<FieldSqlName><IF ALPHA>.PadRight(<FIELD_SIZE>)</IF ALPHA></IF SEG_TAG_EQUAL><,></SEGMENT_LOOP></PRIMARY_KEY></IF STRUCTURE_ISAM><IF STRUCTURE_RELATIVE>aRecordNumber</IF STRUCTURE_RELATIVE>)
                data patchError, @JsonPatchError, ^null
                ;;Did we find it?
                if(<structureNoplural>ToUpdate == ^null)
                    mreturn NotFound()

                ;;Apply the changes to the <structureNoplural> we read
                a<StructureNoplural>.ApplyTo(<structureNoplural>ToUpdate, lambda(error) { patchError = error })
                ;;if the patchdoc was bad return the error info
                if(patchError != ^null)
                    mreturn BadRequest(string.Format("Error applying patch document: error message {0}, caused by {1}", patchError.ErrorMessage, JsonConvert.SerializeObject(patchError.Operation)))

                ;;Update and commit
                _DbContext.<StructurePlural>.Update(<structureNoplural>ToUpdate)
                _DbContext.SaveChanges()
            end
            catch (e, @InvalidOperationException)
            begin
                mreturn BadRequest(e)
            end
            catch (e, @ValidationException)
            begin
                ModelState.AddModelError("RelationValidation",e.Message)
                mreturn BadRequest(ModelState)
            end
            endtry

            mreturn NoContent()

        endmethod

</IF PATCH_ENDPOINT>
</IF DEFINED_ENABLE_PATCH>
;//
;// DELETE --------------------------------------------------------------------
;//
<IF DEFINED_ENABLE_DELETE>
<IF DELETE_ENDPOINT>
  <IF DEFINED_ENABLE_AUTHENTICATION>
    <IF USERTOKEN_ROLES_DELETE>
        {Authorize(Roles="<ROLES_DELETE>")}
    </IF USERTOKEN_ROLES_DELETE>
  </IF DEFINED_ENABLE_AUTHENTICATION>
        {ODataRoute("<StructurePlural>(<IF STRUCTURE_ISAM><PRIMARY_KEY><SEGMENT_LOOP><IF SEG_TAG_EQUAL><ELSE><FieldSqlName>={a<FieldSqlName>}<,></IF SEG_TAG_EQUAL></SEGMENT_LOOP></PRIMARY_KEY></IF STRUCTURE_ISAM><IF STRUCTURE_RELATIVE>RecordNumber={aRecordNumber}</IF STRUCTURE_RELATIVE>)")}
        ;;; <summary>
        ;;; Delete a <structureNoplural>.
        ;;; </summary>
  <IF STRUCTURE_ISAM>
    <PRIMARY_KEY>
      <SEGMENT_LOOP>
        <IF SEG_TAG_EQUAL>
        <ELSE>
        ;;; <param name="a<FieldSqlName>"><FIELD_DESC></param>
        </IF SEG_TAG_EQUAL>
      </SEGMENT_LOOP>
    </PRIMARY_KEY>
  </IF STRUCTURE_ISAM>
  <IF STRUCTURE_RELATIVE>
        ;;; <param name="aRecordNumber">Record number</param>
  </IF STRUCTURE_RELATIVE>
        ;;; <returns>Returns an IActionResult indicating the status of the operation and containing any data that was returned.</returns>
        public method Delete<StructureNoplural>, @IActionResult
  <IF STRUCTURE_ISAM>
    <PRIMARY_KEY>
      <SEGMENT_LOOP>
        <IF SEG_TAG_EQUAL>
        <ELSE>
            {FromODataUri}
          <IF CUSTOM_HARMONY_AS_STRING>
            required in a<FieldSqlName>, string
          <ELSE>
            required in a<FieldSqlName>, <SEGMENT_SNTYPE>
          </IF CUSTOM_HARMONY_AS_STRING>
        </IF SEG_TAG_EQUAL>
      </SEGMENT_LOOP>
    </PRIMARY_KEY>
  </IF STRUCTURE_ISAM>
  <IF STRUCTURE_RELATIVE>
            {FromODataUri}
            required in arecordNumber, int
  </IF STRUCTURE_RELATIVE>
        proc
            ;;Get the <structureNoplural> to be deleted
            data <structureNoplural>ToRemove = _DbContext.<StructurePlural>.Find(<IF STRUCTURE_ISAM><PRIMARY_KEY><SEGMENT_LOOP><IF SEG_TAG_EQUAL><SEGMENT_TAG_VALUE><ELSE>a<FieldSqlName><IF ALPHA>.PadRight(<FIELD_SIZE>)</IF ALPHA></IF SEG_TAG_EQUAL><,></SEGMENT_LOOP></PRIMARY_KEY></IF STRUCTURE_ISAM><IF STRUCTURE_RELATIVE>aRecordNumber</IF STRUCTURE_RELATIVE>)

            ;;Did we find it?
            if (<structureNoplural>ToRemove == ^null)
                mreturn NotFound()

            ;;Delete and commit
            _DbContext.<StructurePlural>.Remove(<structureNoplural>ToRemove)
            _DbContext.SaveChanges()

            mreturn NoContent()

        endmethod

</IF DELETE_ENDPOINT>
</IF DEFINED_ENABLE_DELETE>
    endclass

endnamespace