import { BluefinTecsMerchantPortalEntityBase } from '../BluefinTecsMerchantPortalEntityBase';
import type { BluefinTecsMerchantPortalSDK } from '../BluefinTecsMerchantPortalSDK';
import type { Control } from '../types';
import type { MerchantPortalPamDocumentController, MerchantPortalPamDocumentControllerCreateData } from '../BluefinTecsMerchantPortalTypes';
declare class MerchantPortalPamDocumentControllerEntity extends BluefinTecsMerchantPortalEntityBase<MerchantPortalPamDocumentController> {
    constructor(client: BluefinTecsMerchantPortalSDK, entopts: any);
    make(this: MerchantPortalPamDocumentControllerEntity): MerchantPortalPamDocumentControllerEntity;
    create(this: any, reqdata?: MerchantPortalPamDocumentControllerCreateData, ctrl?: Control): Promise<MerchantPortalPamDocumentControllerEntity>;
}
export { MerchantPortalPamDocumentControllerEntity };
