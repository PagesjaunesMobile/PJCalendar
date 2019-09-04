/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRProfessionnel: StargateKitModel {

    public enum SKRTypeEtablissement: String, Codable, Hashable, CaseIterable {
        case restaurant = "RESTAURANT"
        case hebergement = "HEBERGEMENT"
        case generique = "GENERIQUE"
        case sante = "SANTE"
        case beaute = "BEAUTE"
        case transac = "TRANSAC"
        case lost = "LOST"
    }

    public enum SKRTypeInscription: String, Codable, Hashable, CaseIterable {
        case professionnel = "PROFESSIONNEL"
        case particulier = "PARTICULIER"
    }

    public enum SKRTypeParcoursTransac: String, Codable, Hashable, CaseIterable {
        case generique = "GENERIQUE"
        case parCreneaux = "PAR_CRENEAUX"
        case parPrestations = "PAR_PRESTATIONS"
    }

    public var acceptationAme: Bool?

    public var acceptationCmu: Bool?

    public var acceptationTiersPayant: Bool?

    public var accesHandicapes: Bool?

    public var activites: [SKRRubriqueOrcFD]?

    public var ambiances: SKRMasquableSEOElementListeOrcFDLibelleLogoOrcFD?

    public var annonceur: Bool?

    public var ascenseur: Bool?

    public var b2b: SKRB2BOrcFD?

    public var blocPrestations: SKRBlocPrestationsOrcFD?

    public var bodacc: SKRBodaccOrcFD?

    public var capacitesAccueil: SKRMasquableSEOElementListeOrcFDCapaciteAccueilOrcFD?

    public var categories: SKRMasquableSEOElementListeOrcFDCategorieOrcFD?

    public var certifications: SKRMasquableSEOElementListeOrcFDLibelleLogoOrcFD?

    public var codeEtablissement: String?

    public var concerneCviv: Bool?

    public var contextePubliciteX20: SKRContextePubliciteX20OrcFD?

    public var contextesPublicitesX20: [SKRContextePubliciteX20OrcFD]?

    public var conventionnement: SKRConventionnementOrcFD?

    public var coupeDuMonde: Bool?

    public var criteresRecherche: SKRMasquableSEOElementListeOrcFDCategorieCritereRechercheOrcFD?

    public var cvivSelectionnee: SKRProduitPubCVIVOrcFD?

    public var dateCreation: SKRMasquableSEOElementListeOrcFDLibelleLogoOrcFD?

    public var dateFraicheurDonneesAmeli: String?

    public var dateMiseaJour: String?

    public var descriptions: SKRMasquableSEOElementListeOrcFDDescriptionOrcFD?

    public var diplomes: SKRMasquableSEOElementListeOrcFDLibelleLogoOrcFD?

    public var diplomesFormations: SKRMasquableSEOElementListeOrcFDLibelleLogoOrcFD?

    public var donneesBonsPlans: SKRDonneesBonsPlansOrcFD?

    public var donneesPhotos: SKRDonneesPhotosOrcFD?

    public var donneesPrestations: SKRMasquableSEOElementListeOrcFDDonneesSousTitresOrcFD?

    public var donneesProduits: SKRMasquableSEOElementListeOrcFDDonneesSousTitresOrcFD?

    public var donneesVideos: SKRDonneesVideosOrcFD?

    public var ecoResponsabilite: SKREcoResponsabiliteOrcFD?

    public var eligibleEdition: Bool?

    public var eligiblePushAnnonceur: Bool?

    public var eligibleRemarketing: Bool?

    public var equipe: SKREquipeOrcFD?

    public var equipements: SKRMasquableSEOElementListeOrcFDLibelleLogoOrcFD?

    public var etabRepris: Bool?

    public var etage: String?

    public var filActualite: SKRFilActualiteOrcFD?

    public var guides: SKRMasquableSEOElementListeOrcFDLibelleLogoOrcFD?

    public var hasTransacSante: Bool?

    public var hebergement: SKRHebergementOrcFD?

    public var honoraires: SKRMasquableSEOElementListeOrcFDLibelleLogoOrcFD?

    public var identifiantBloc: String?

    public var infoContributif: SKRInfoContributifOrcFD?

    public var informationsCarte: SKRInformationsCarteApiInscriptionOrcFD?

    public var informationsCoordonnees: SKRInformationsCoordonneesOrcFD?

    public var informationsHoraires: SKRInformationsHorairesOrcFD?

    public var informationsOpenGraph: SKRInformationsOpenGraphOrcFD?

    public var informationsSeo: SKRInformationsSEOOrcFD?

    public var informationsTarifaires: SKRInformationsTarifairesOrcFD?

    public var languesParlees: SKRMasquableSEOElementListeOrcFDLibelleLogoOrcFD?

    public var lienFdLafourchette: String?

    public var lienFicheDetailleeLafourchette: SKRLienFDLafourchetteOrcFD?

    public var liensCatalogues: SKRMasquableSEOElementListeOrcFDLienTransactionnelApiInscriptionOrcFD?

    public var liensTransactionnels: SKRMasquableSEOElementListeOrcFDLienTransactionnelApiInscriptionOrcFD?

    public var lstDonneesMarques: SKRMasquableSEOElementListeOrcFDLstDonneesMarquesOrcFD?

    public var lstEquipementsSportifs: SKRMasquableSEOElementListeOrcFDEquipementsSportifsOrcFD?

    public var lstMoyensPaiement: SKRMasquableSEOElementListeOrcFDLibelleLogoOrcFD?

    public var lstNomsChefs: SKRMasquableSEOElementListeOrcFDLibelleLogoOrcFD?

    public var lstTypesCuisines: SKRMasquableSEOElementListeOrcFDLibelleLogoOrcFD?

    public var mentionsObligatoires: [SKRMentionObligatoireOrcFD]?

    public var menu: SKRMenuOrcFD?

    public var nbChambres: SKRMasquableSEOElementListeOrcFDDonneesSousTitresOrcFD?

    public var nombreCouverts: SKRMasquableSEOElementListeOrcFDLibelleLogoOrcFD?

    public var organisation: SKROrganisationOrcFD?

    public var packPresenceManagement: Bool?

    public var promotionsLafourchette: SKRPromotionsLafourchetteOrcFD?

    public var publications: SKRMasquableSEOElementListeOrcFDLibelleLogoOrcFD?

    public var recommandationsPro: [String]?

    public var regroupementsActivites: [SKRRegroupementActiviteOrcFD]?

    public var reseaux: SKRMasquableSEOElementListeOrcFDLibelleLogoOrcFD?

    public var restaurants: SKRMasquableSEOElementListeOrcFDLibelleLogoOrcFD?

    public var restauration: SKRRestaurationOrcFD?

    public var sensible: Bool?

    public var sitesEtReseauxSociaux: SKRMasquableSEOElementListeOrcFDLienVersSiteReseauSocialOrcFD?

    public var specialites: SKRMasquableSEOElementListeOrcFDLibelleLogoOrcFD?

    public var titre: String?

    public var transactionnel: SKRTransactionnelOrcFD?

    public var typeEtablissement: SKRTypeEtablissement?

    public var typeInscription: SKRTypeInscription?

    public var typeParcoursTransac: SKRTypeParcoursTransac?

    public var typeTransacRdv: String?

    public var typesClientele: SKRMasquableSEOElementListeOrcFDLibelleLogoOrcFD?

    public var visuel: SKRVisuelOrcFD?

    public var visuels: [SKRVisuelOrcFD]?

    public var vitrinesAnnonces: [SKRVitrineAnnoncesOrcFD]?

    public var vitrinesProduitsServices: SKRMasquableSEOElementListeOrcFDVitrineProduitsServicesOrcFD?

    public var zonesChalandise: SKRMasquableSEOElementListeOrcFDLibelleLogoOrcFD?

    public init(acceptationAme: Bool? = nil, acceptationCmu: Bool? = nil, acceptationTiersPayant: Bool? = nil, accesHandicapes: Bool? = nil, activites: [SKRRubriqueOrcFD]? = nil, ambiances: SKRMasquableSEOElementListeOrcFDLibelleLogoOrcFD? = nil, annonceur: Bool? = nil, ascenseur: Bool? = nil, b2b: SKRB2BOrcFD? = nil, blocPrestations: SKRBlocPrestationsOrcFD? = nil, bodacc: SKRBodaccOrcFD? = nil, capacitesAccueil: SKRMasquableSEOElementListeOrcFDCapaciteAccueilOrcFD? = nil, categories: SKRMasquableSEOElementListeOrcFDCategorieOrcFD? = nil, certifications: SKRMasquableSEOElementListeOrcFDLibelleLogoOrcFD? = nil, codeEtablissement: String? = nil, concerneCviv: Bool? = nil, contextePubliciteX20: SKRContextePubliciteX20OrcFD? = nil, contextesPublicitesX20: [SKRContextePubliciteX20OrcFD]? = nil, conventionnement: SKRConventionnementOrcFD? = nil, coupeDuMonde: Bool? = nil, criteresRecherche: SKRMasquableSEOElementListeOrcFDCategorieCritereRechercheOrcFD? = nil, cvivSelectionnee: SKRProduitPubCVIVOrcFD? = nil, dateCreation: SKRMasquableSEOElementListeOrcFDLibelleLogoOrcFD? = nil, dateFraicheurDonneesAmeli: String? = nil, dateMiseaJour: String? = nil, descriptions: SKRMasquableSEOElementListeOrcFDDescriptionOrcFD? = nil, diplomes: SKRMasquableSEOElementListeOrcFDLibelleLogoOrcFD? = nil, diplomesFormations: SKRMasquableSEOElementListeOrcFDLibelleLogoOrcFD? = nil, donneesBonsPlans: SKRDonneesBonsPlansOrcFD? = nil, donneesPhotos: SKRDonneesPhotosOrcFD? = nil, donneesPrestations: SKRMasquableSEOElementListeOrcFDDonneesSousTitresOrcFD? = nil, donneesProduits: SKRMasquableSEOElementListeOrcFDDonneesSousTitresOrcFD? = nil, donneesVideos: SKRDonneesVideosOrcFD? = nil, ecoResponsabilite: SKREcoResponsabiliteOrcFD? = nil, eligibleEdition: Bool? = nil, eligiblePushAnnonceur: Bool? = nil, eligibleRemarketing: Bool? = nil, equipe: SKREquipeOrcFD? = nil, equipements: SKRMasquableSEOElementListeOrcFDLibelleLogoOrcFD? = nil, etabRepris: Bool? = nil, etage: String? = nil, filActualite: SKRFilActualiteOrcFD? = nil, guides: SKRMasquableSEOElementListeOrcFDLibelleLogoOrcFD? = nil, hasTransacSante: Bool? = nil, hebergement: SKRHebergementOrcFD? = nil, honoraires: SKRMasquableSEOElementListeOrcFDLibelleLogoOrcFD? = nil, identifiantBloc: String? = nil, infoContributif: SKRInfoContributifOrcFD? = nil, informationsCarte: SKRInformationsCarteApiInscriptionOrcFD? = nil, informationsCoordonnees: SKRInformationsCoordonneesOrcFD? = nil, informationsHoraires: SKRInformationsHorairesOrcFD? = nil, informationsOpenGraph: SKRInformationsOpenGraphOrcFD? = nil, informationsSeo: SKRInformationsSEOOrcFD? = nil, informationsTarifaires: SKRInformationsTarifairesOrcFD? = nil, languesParlees: SKRMasquableSEOElementListeOrcFDLibelleLogoOrcFD? = nil, lienFdLafourchette: String? = nil, lienFicheDetailleeLafourchette: SKRLienFDLafourchetteOrcFD? = nil, liensCatalogues: SKRMasquableSEOElementListeOrcFDLienTransactionnelApiInscriptionOrcFD? = nil, liensTransactionnels: SKRMasquableSEOElementListeOrcFDLienTransactionnelApiInscriptionOrcFD? = nil, lstDonneesMarques: SKRMasquableSEOElementListeOrcFDLstDonneesMarquesOrcFD? = nil, lstEquipementsSportifs: SKRMasquableSEOElementListeOrcFDEquipementsSportifsOrcFD? = nil, lstMoyensPaiement: SKRMasquableSEOElementListeOrcFDLibelleLogoOrcFD? = nil, lstNomsChefs: SKRMasquableSEOElementListeOrcFDLibelleLogoOrcFD? = nil, lstTypesCuisines: SKRMasquableSEOElementListeOrcFDLibelleLogoOrcFD? = nil, mentionsObligatoires: [SKRMentionObligatoireOrcFD]? = nil, menu: SKRMenuOrcFD? = nil, nbChambres: SKRMasquableSEOElementListeOrcFDDonneesSousTitresOrcFD? = nil, nombreCouverts: SKRMasquableSEOElementListeOrcFDLibelleLogoOrcFD? = nil, organisation: SKROrganisationOrcFD? = nil, packPresenceManagement: Bool? = nil, promotionsLafourchette: SKRPromotionsLafourchetteOrcFD? = nil, publications: SKRMasquableSEOElementListeOrcFDLibelleLogoOrcFD? = nil, recommandationsPro: [String]? = nil, regroupementsActivites: [SKRRegroupementActiviteOrcFD]? = nil, reseaux: SKRMasquableSEOElementListeOrcFDLibelleLogoOrcFD? = nil, restaurants: SKRMasquableSEOElementListeOrcFDLibelleLogoOrcFD? = nil, restauration: SKRRestaurationOrcFD? = nil, sensible: Bool? = nil, sitesEtReseauxSociaux: SKRMasquableSEOElementListeOrcFDLienVersSiteReseauSocialOrcFD? = nil, specialites: SKRMasquableSEOElementListeOrcFDLibelleLogoOrcFD? = nil, titre: String? = nil, transactionnel: SKRTransactionnelOrcFD? = nil, typeEtablissement: SKRTypeEtablissement? = nil, typeInscription: SKRTypeInscription? = nil, typeParcoursTransac: SKRTypeParcoursTransac? = nil, typeTransacRdv: String? = nil, typesClientele: SKRMasquableSEOElementListeOrcFDLibelleLogoOrcFD? = nil, visuel: SKRVisuelOrcFD? = nil, visuels: [SKRVisuelOrcFD]? = nil, vitrinesAnnonces: [SKRVitrineAnnoncesOrcFD]? = nil, vitrinesProduitsServices: SKRMasquableSEOElementListeOrcFDVitrineProduitsServicesOrcFD? = nil, zonesChalandise: SKRMasquableSEOElementListeOrcFDLibelleLogoOrcFD? = nil) {
        self.acceptationAme = acceptationAme
        self.acceptationCmu = acceptationCmu
        self.acceptationTiersPayant = acceptationTiersPayant
        self.accesHandicapes = accesHandicapes
        self.activites = activites
        self.ambiances = ambiances
        self.annonceur = annonceur
        self.ascenseur = ascenseur
        self.b2b = b2b
        self.blocPrestations = blocPrestations
        self.bodacc = bodacc
        self.capacitesAccueil = capacitesAccueil
        self.categories = categories
        self.certifications = certifications
        self.codeEtablissement = codeEtablissement
        self.concerneCviv = concerneCviv
        self.contextePubliciteX20 = contextePubliciteX20
        self.contextesPublicitesX20 = contextesPublicitesX20
        self.conventionnement = conventionnement
        self.coupeDuMonde = coupeDuMonde
        self.criteresRecherche = criteresRecherche
        self.cvivSelectionnee = cvivSelectionnee
        self.dateCreation = dateCreation
        self.dateFraicheurDonneesAmeli = dateFraicheurDonneesAmeli
        self.dateMiseaJour = dateMiseaJour
        self.descriptions = descriptions
        self.diplomes = diplomes
        self.diplomesFormations = diplomesFormations
        self.donneesBonsPlans = donneesBonsPlans
        self.donneesPhotos = donneesPhotos
        self.donneesPrestations = donneesPrestations
        self.donneesProduits = donneesProduits
        self.donneesVideos = donneesVideos
        self.ecoResponsabilite = ecoResponsabilite
        self.eligibleEdition = eligibleEdition
        self.eligiblePushAnnonceur = eligiblePushAnnonceur
        self.eligibleRemarketing = eligibleRemarketing
        self.equipe = equipe
        self.equipements = equipements
        self.etabRepris = etabRepris
        self.etage = etage
        self.filActualite = filActualite
        self.guides = guides
        self.hasTransacSante = hasTransacSante
        self.hebergement = hebergement
        self.honoraires = honoraires
        self.identifiantBloc = identifiantBloc
        self.infoContributif = infoContributif
        self.informationsCarte = informationsCarte
        self.informationsCoordonnees = informationsCoordonnees
        self.informationsHoraires = informationsHoraires
        self.informationsOpenGraph = informationsOpenGraph
        self.informationsSeo = informationsSeo
        self.informationsTarifaires = informationsTarifaires
        self.languesParlees = languesParlees
        self.lienFdLafourchette = lienFdLafourchette
        self.lienFicheDetailleeLafourchette = lienFicheDetailleeLafourchette
        self.liensCatalogues = liensCatalogues
        self.liensTransactionnels = liensTransactionnels
        self.lstDonneesMarques = lstDonneesMarques
        self.lstEquipementsSportifs = lstEquipementsSportifs
        self.lstMoyensPaiement = lstMoyensPaiement
        self.lstNomsChefs = lstNomsChefs
        self.lstTypesCuisines = lstTypesCuisines
        self.mentionsObligatoires = mentionsObligatoires
        self.menu = menu
        self.nbChambres = nbChambres
        self.nombreCouverts = nombreCouverts
        self.organisation = organisation
        self.packPresenceManagement = packPresenceManagement
        self.promotionsLafourchette = promotionsLafourchette
        self.publications = publications
        self.recommandationsPro = recommandationsPro
        self.regroupementsActivites = regroupementsActivites
        self.reseaux = reseaux
        self.restaurants = restaurants
        self.restauration = restauration
        self.sensible = sensible
        self.sitesEtReseauxSociaux = sitesEtReseauxSociaux
        self.specialites = specialites
        self.titre = titre
        self.transactionnel = transactionnel
        self.typeEtablissement = typeEtablissement
        self.typeInscription = typeInscription
        self.typeParcoursTransac = typeParcoursTransac
        self.typeTransacRdv = typeTransacRdv
        self.typesClientele = typesClientele
        self.visuel = visuel
        self.visuels = visuels
        self.vitrinesAnnonces = vitrinesAnnonces
        self.vitrinesProduitsServices = vitrinesProduitsServices
        self.zonesChalandise = zonesChalandise
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case acceptationAme = "acceptation_ame"
        case acceptationCmu = "acceptation_cmu"
        case acceptationTiersPayant = "acceptation_tiers_payant"
        case accesHandicapes = "acces_handicapes"
        case activites
        case ambiances
        case annonceur
        case ascenseur
        case b2b
        case blocPrestations = "bloc_prestations"
        case bodacc
        case capacitesAccueil = "capacites_accueil"
        case categories
        case certifications
        case codeEtablissement = "code_etablissement"
        case concerneCviv = "concerne_cviv"
        case contextePubliciteX20 = "contexte_publicite_x20"
        case contextesPublicitesX20 = "contextes_publicites_x20"
        case conventionnement
        case coupeDuMonde = "coupe_du_monde"
        case criteresRecherche = "criteres_recherche"
        case cvivSelectionnee = "cviv_selectionnee"
        case dateCreation
        case dateFraicheurDonneesAmeli = "date_fraicheur_donnees_ameli"
        case dateMiseaJour = "date_mise_a_jour"
        case descriptions
        case diplomes
        case diplomesFormations = "diplomes_formations"
        case donneesBonsPlans = "donnees_bons_plans"
        case donneesPhotos = "donnees_photos"
        case donneesPrestations = "donnees_prestations"
        case donneesProduits = "donnees_produits"
        case donneesVideos = "donnees_videos"
        case ecoResponsabilite = "eco_responsabilite"
        case eligibleEdition = "eligible_edition"
        case eligiblePushAnnonceur = "eligible_push_annonceur"
        case eligibleRemarketing = "eligible_remarketing"
        case equipe
        case equipements
        case etabRepris = "etab_repris"
        case etage
        case filActualite = "fil_actualite"
        case guides
        case hasTransacSante = "has_transac_sante"
        case hebergement
        case honoraires
        case identifiantBloc = "identifiant_bloc"
        case infoContributif = "info_contributif"
        case informationsCarte = "informations_carte"
        case informationsCoordonnees = "informations_coordonnees"
        case informationsHoraires = "informations_horaires"
        case informationsOpenGraph = "informations_open_graph"
        case informationsSeo = "informations_seo"
        case informationsTarifaires = "informations_tarifaires"
        case languesParlees = "langues_parlees"
        case lienFdLafourchette = "lien_fd_lafourchette"
        case lienFicheDetailleeLafourchette = "lien_fiche_detaillee_lafourchette"
        case liensCatalogues = "liens_catalogues"
        case liensTransactionnels = "liens_transactionnels"
        case lstDonneesMarques = "lst_donnees_marques"
        case lstEquipementsSportifs = "lst_equipements_sportifs"
        case lstMoyensPaiement = "lst_moyens_paiement"
        case lstNomsChefs = "lst_noms_chefs"
        case lstTypesCuisines = "lst_types_cuisines"
        case mentionsObligatoires = "mentions_obligatoires"
        case menu
        case nbChambres = "nb_chambres"
        case nombreCouverts = "nombre_couverts"
        case organisation
        case packPresenceManagement = "pack_presence_management"
        case promotionsLafourchette = "promotions_lafourchette"
        case publications
        case recommandationsPro = "recommandations_pro"
        case regroupementsActivites = "regroupements_activites"
        case reseaux
        case restaurants
        case restauration
        case sensible
        case sitesEtReseauxSociaux = "sites_et_reseaux_sociaux"
        case specialites
        case titre
        case transactionnel
        case typeEtablissement = "type_etablissement"
        case typeInscription = "type_inscription"
        case typeParcoursTransac = "type_parcours_transac"
        case typeTransacRdv = "type_transac_rdv"
        case typesClientele = "types_clientele"
        case visuel
        case visuels
        case vitrinesAnnonces = "vitrines_annonces"
        case vitrinesProduitsServices = "vitrines_produits_services"
        case zonesChalandise = "zones_chalandise"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        acceptationAme = try container.decodeIfPresent(.acceptationAme)
        acceptationCmu = try container.decodeIfPresent(.acceptationCmu)
        acceptationTiersPayant = try container.decodeIfPresent(.acceptationTiersPayant)
        accesHandicapes = try container.decodeIfPresent(.accesHandicapes)
        activites = try container.decodeArrayIfPresent(.activites)
        ambiances = try container.decodeIfPresent(.ambiances)
        annonceur = try container.decodeIfPresent(.annonceur)
        ascenseur = try container.decodeIfPresent(.ascenseur)
        b2b = try container.decodeIfPresent(.b2b)
        blocPrestations = try container.decodeIfPresent(.blocPrestations)
        bodacc = try container.decodeIfPresent(.bodacc)
        capacitesAccueil = try container.decodeIfPresent(.capacitesAccueil)
        categories = try container.decodeIfPresent(.categories)
        certifications = try container.decodeIfPresent(.certifications)
        codeEtablissement = try container.decodeIfPresent(.codeEtablissement)
        concerneCviv = try container.decodeIfPresent(.concerneCviv)
        contextePubliciteX20 = try container.decodeIfPresent(.contextePubliciteX20)
        contextesPublicitesX20 = try container.decodeArrayIfPresent(.contextesPublicitesX20)
        conventionnement = try container.decodeIfPresent(.conventionnement)
        coupeDuMonde = try container.decodeIfPresent(.coupeDuMonde)
        criteresRecherche = try container.decodeIfPresent(.criteresRecherche)
        cvivSelectionnee = try container.decodeIfPresent(.cvivSelectionnee)
        dateCreation = try container.decodeIfPresent(.dateCreation)
        dateFraicheurDonneesAmeli = try container.decodeIfPresent(.dateFraicheurDonneesAmeli)
        dateMiseaJour = try container.decodeIfPresent(.dateMiseaJour)
        descriptions = try container.decodeIfPresent(.descriptions)
        diplomes = try container.decodeIfPresent(.diplomes)
        diplomesFormations = try container.decodeIfPresent(.diplomesFormations)
        donneesBonsPlans = try container.decodeIfPresent(.donneesBonsPlans)
        donneesPhotos = try container.decodeIfPresent(.donneesPhotos)
        donneesPrestations = try container.decodeIfPresent(.donneesPrestations)
        donneesProduits = try container.decodeIfPresent(.donneesProduits)
        donneesVideos = try container.decodeIfPresent(.donneesVideos)
        ecoResponsabilite = try container.decodeIfPresent(.ecoResponsabilite)
        eligibleEdition = try container.decodeIfPresent(.eligibleEdition)
        eligiblePushAnnonceur = try container.decodeIfPresent(.eligiblePushAnnonceur)
        eligibleRemarketing = try container.decodeIfPresent(.eligibleRemarketing)
        equipe = try container.decodeIfPresent(.equipe)
        equipements = try container.decodeIfPresent(.equipements)
        etabRepris = try container.decodeIfPresent(.etabRepris)
        etage = try container.decodeIfPresent(.etage)
        filActualite = try container.decodeIfPresent(.filActualite)
        guides = try container.decodeIfPresent(.guides)
        hasTransacSante = try container.decodeIfPresent(.hasTransacSante)
        hebergement = try container.decodeIfPresent(.hebergement)
        honoraires = try container.decodeIfPresent(.honoraires)
        identifiantBloc = try container.decodeIfPresent(.identifiantBloc)
        infoContributif = try container.decodeIfPresent(.infoContributif)
        informationsCarte = try container.decodeIfPresent(.informationsCarte)
        informationsCoordonnees = try container.decodeIfPresent(.informationsCoordonnees)
        informationsHoraires = try container.decodeIfPresent(.informationsHoraires)
        informationsOpenGraph = try container.decodeIfPresent(.informationsOpenGraph)
        informationsSeo = try container.decodeIfPresent(.informationsSeo)
        informationsTarifaires = try container.decodeIfPresent(.informationsTarifaires)
        languesParlees = try container.decodeIfPresent(.languesParlees)
        lienFdLafourchette = try container.decodeIfPresent(.lienFdLafourchette)
        lienFicheDetailleeLafourchette = try container.decodeIfPresent(.lienFicheDetailleeLafourchette)
        liensCatalogues = try container.decodeIfPresent(.liensCatalogues)
        liensTransactionnels = try container.decodeIfPresent(.liensTransactionnels)
        lstDonneesMarques = try container.decodeIfPresent(.lstDonneesMarques)
        lstEquipementsSportifs = try container.decodeIfPresent(.lstEquipementsSportifs)
        lstMoyensPaiement = try container.decodeIfPresent(.lstMoyensPaiement)
        lstNomsChefs = try container.decodeIfPresent(.lstNomsChefs)
        lstTypesCuisines = try container.decodeIfPresent(.lstTypesCuisines)
        mentionsObligatoires = try container.decodeArrayIfPresent(.mentionsObligatoires)
        menu = try container.decodeIfPresent(.menu)
        nbChambres = try container.decodeIfPresent(.nbChambres)
        nombreCouverts = try container.decodeIfPresent(.nombreCouverts)
        organisation = try container.decodeIfPresent(.organisation)
        packPresenceManagement = try container.decodeIfPresent(.packPresenceManagement)
        promotionsLafourchette = try container.decodeIfPresent(.promotionsLafourchette)
        publications = try container.decodeIfPresent(.publications)
        recommandationsPro = try container.decodeArrayIfPresent(.recommandationsPro)
        regroupementsActivites = try container.decodeArrayIfPresent(.regroupementsActivites)
        reseaux = try container.decodeIfPresent(.reseaux)
        restaurants = try container.decodeIfPresent(.restaurants)
        restauration = try container.decodeIfPresent(.restauration)
        sensible = try container.decodeIfPresent(.sensible)
        sitesEtReseauxSociaux = try container.decodeIfPresent(.sitesEtReseauxSociaux)
        specialites = try container.decodeIfPresent(.specialites)
        titre = try container.decodeIfPresent(.titre)
        transactionnel = try container.decodeIfPresent(.transactionnel)
        typeEtablissement = try container.decodeIfPresent(.typeEtablissement)
        typeInscription = try container.decodeIfPresent(.typeInscription)
        typeParcoursTransac = try container.decodeIfPresent(.typeParcoursTransac)
        typeTransacRdv = try container.decodeIfPresent(.typeTransacRdv)
        typesClientele = try container.decodeIfPresent(.typesClientele)
        visuel = try container.decodeIfPresent(.visuel)
        visuels = try container.decodeArrayIfPresent(.visuels)
        vitrinesAnnonces = try container.decodeArrayIfPresent(.vitrinesAnnonces)
        vitrinesProduitsServices = try container.decodeIfPresent(.vitrinesProduitsServices)
        zonesChalandise = try container.decodeIfPresent(.zonesChalandise)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(acceptationAme, forKey: .acceptationAme)
        try container.encodeIfPresent(acceptationCmu, forKey: .acceptationCmu)
        try container.encodeIfPresent(acceptationTiersPayant, forKey: .acceptationTiersPayant)
        try container.encodeIfPresent(accesHandicapes, forKey: .accesHandicapes)
        try container.encodeIfPresent(activites, forKey: .activites)
        try container.encodeIfPresent(ambiances, forKey: .ambiances)
        try container.encodeIfPresent(annonceur, forKey: .annonceur)
        try container.encodeIfPresent(ascenseur, forKey: .ascenseur)
        try container.encodeIfPresent(b2b, forKey: .b2b)
        try container.encodeIfPresent(blocPrestations, forKey: .blocPrestations)
        try container.encodeIfPresent(bodacc, forKey: .bodacc)
        try container.encodeIfPresent(capacitesAccueil, forKey: .capacitesAccueil)
        try container.encodeIfPresent(categories, forKey: .categories)
        try container.encodeIfPresent(certifications, forKey: .certifications)
        try container.encodeIfPresent(codeEtablissement, forKey: .codeEtablissement)
        try container.encodeIfPresent(concerneCviv, forKey: .concerneCviv)
        try container.encodeIfPresent(contextePubliciteX20, forKey: .contextePubliciteX20)
        try container.encodeIfPresent(contextesPublicitesX20, forKey: .contextesPublicitesX20)
        try container.encodeIfPresent(conventionnement, forKey: .conventionnement)
        try container.encodeIfPresent(coupeDuMonde, forKey: .coupeDuMonde)
        try container.encodeIfPresent(criteresRecherche, forKey: .criteresRecherche)
        try container.encodeIfPresent(cvivSelectionnee, forKey: .cvivSelectionnee)
        try container.encodeIfPresent(dateCreation, forKey: .dateCreation)
        try container.encodeIfPresent(dateFraicheurDonneesAmeli, forKey: .dateFraicheurDonneesAmeli)
        try container.encodeIfPresent(dateMiseaJour, forKey: .dateMiseaJour)
        try container.encodeIfPresent(descriptions, forKey: .descriptions)
        try container.encodeIfPresent(diplomes, forKey: .diplomes)
        try container.encodeIfPresent(diplomesFormations, forKey: .diplomesFormations)
        try container.encodeIfPresent(donneesBonsPlans, forKey: .donneesBonsPlans)
        try container.encodeIfPresent(donneesPhotos, forKey: .donneesPhotos)
        try container.encodeIfPresent(donneesPrestations, forKey: .donneesPrestations)
        try container.encodeIfPresent(donneesProduits, forKey: .donneesProduits)
        try container.encodeIfPresent(donneesVideos, forKey: .donneesVideos)
        try container.encodeIfPresent(ecoResponsabilite, forKey: .ecoResponsabilite)
        try container.encodeIfPresent(eligibleEdition, forKey: .eligibleEdition)
        try container.encodeIfPresent(eligiblePushAnnonceur, forKey: .eligiblePushAnnonceur)
        try container.encodeIfPresent(eligibleRemarketing, forKey: .eligibleRemarketing)
        try container.encodeIfPresent(equipe, forKey: .equipe)
        try container.encodeIfPresent(equipements, forKey: .equipements)
        try container.encodeIfPresent(etabRepris, forKey: .etabRepris)
        try container.encodeIfPresent(etage, forKey: .etage)
        try container.encodeIfPresent(filActualite, forKey: .filActualite)
        try container.encodeIfPresent(guides, forKey: .guides)
        try container.encodeIfPresent(hasTransacSante, forKey: .hasTransacSante)
        try container.encodeIfPresent(hebergement, forKey: .hebergement)
        try container.encodeIfPresent(honoraires, forKey: .honoraires)
        try container.encodeIfPresent(identifiantBloc, forKey: .identifiantBloc)
        try container.encodeIfPresent(infoContributif, forKey: .infoContributif)
        try container.encodeIfPresent(informationsCarte, forKey: .informationsCarte)
        try container.encodeIfPresent(informationsCoordonnees, forKey: .informationsCoordonnees)
        try container.encodeIfPresent(informationsHoraires, forKey: .informationsHoraires)
        try container.encodeIfPresent(informationsOpenGraph, forKey: .informationsOpenGraph)
        try container.encodeIfPresent(informationsSeo, forKey: .informationsSeo)
        try container.encodeIfPresent(informationsTarifaires, forKey: .informationsTarifaires)
        try container.encodeIfPresent(languesParlees, forKey: .languesParlees)
        try container.encodeIfPresent(lienFdLafourchette, forKey: .lienFdLafourchette)
        try container.encodeIfPresent(lienFicheDetailleeLafourchette, forKey: .lienFicheDetailleeLafourchette)
        try container.encodeIfPresent(liensCatalogues, forKey: .liensCatalogues)
        try container.encodeIfPresent(liensTransactionnels, forKey: .liensTransactionnels)
        try container.encodeIfPresent(lstDonneesMarques, forKey: .lstDonneesMarques)
        try container.encodeIfPresent(lstEquipementsSportifs, forKey: .lstEquipementsSportifs)
        try container.encodeIfPresent(lstMoyensPaiement, forKey: .lstMoyensPaiement)
        try container.encodeIfPresent(lstNomsChefs, forKey: .lstNomsChefs)
        try container.encodeIfPresent(lstTypesCuisines, forKey: .lstTypesCuisines)
        try container.encodeIfPresent(mentionsObligatoires, forKey: .mentionsObligatoires)
        try container.encodeIfPresent(menu, forKey: .menu)
        try container.encodeIfPresent(nbChambres, forKey: .nbChambres)
        try container.encodeIfPresent(nombreCouverts, forKey: .nombreCouverts)
        try container.encodeIfPresent(organisation, forKey: .organisation)
        try container.encodeIfPresent(packPresenceManagement, forKey: .packPresenceManagement)
        try container.encodeIfPresent(promotionsLafourchette, forKey: .promotionsLafourchette)
        try container.encodeIfPresent(publications, forKey: .publications)
        try container.encodeIfPresent(recommandationsPro, forKey: .recommandationsPro)
        try container.encodeIfPresent(regroupementsActivites, forKey: .regroupementsActivites)
        try container.encodeIfPresent(reseaux, forKey: .reseaux)
        try container.encodeIfPresent(restaurants, forKey: .restaurants)
        try container.encodeIfPresent(restauration, forKey: .restauration)
        try container.encodeIfPresent(sensible, forKey: .sensible)
        try container.encodeIfPresent(sitesEtReseauxSociaux, forKey: .sitesEtReseauxSociaux)
        try container.encodeIfPresent(specialites, forKey: .specialites)
        try container.encodeIfPresent(titre, forKey: .titre)
        try container.encodeIfPresent(transactionnel, forKey: .transactionnel)
        try container.encodeIfPresent(typeEtablissement, forKey: .typeEtablissement)
        try container.encodeIfPresent(typeInscription, forKey: .typeInscription)
        try container.encodeIfPresent(typeParcoursTransac, forKey: .typeParcoursTransac)
        try container.encodeIfPresent(typeTransacRdv, forKey: .typeTransacRdv)
        try container.encodeIfPresent(typesClientele, forKey: .typesClientele)
        try container.encodeIfPresent(visuel, forKey: .visuel)
        try container.encodeIfPresent(visuels, forKey: .visuels)
        try container.encodeIfPresent(vitrinesAnnonces, forKey: .vitrinesAnnonces)
        try container.encodeIfPresent(vitrinesProduitsServices, forKey: .vitrinesProduitsServices)
        try container.encodeIfPresent(zonesChalandise, forKey: .zonesChalandise)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRProfessionnel else { return false }
      guard self.acceptationAme == object.acceptationAme else { return false }
      guard self.acceptationCmu == object.acceptationCmu else { return false }
      guard self.acceptationTiersPayant == object.acceptationTiersPayant else { return false }
      guard self.accesHandicapes == object.accesHandicapes else { return false }
      guard self.activites == object.activites else { return false }
      guard self.ambiances == object.ambiances else { return false }
      guard self.annonceur == object.annonceur else { return false }
      guard self.ascenseur == object.ascenseur else { return false }
      guard self.b2b == object.b2b else { return false }
      guard self.blocPrestations == object.blocPrestations else { return false }
      guard self.bodacc == object.bodacc else { return false }
      guard self.capacitesAccueil == object.capacitesAccueil else { return false }
      guard self.categories == object.categories else { return false }
      guard self.certifications == object.certifications else { return false }
      guard self.codeEtablissement == object.codeEtablissement else { return false }
      guard self.concerneCviv == object.concerneCviv else { return false }
      guard self.contextePubliciteX20 == object.contextePubliciteX20 else { return false }
      guard self.contextesPublicitesX20 == object.contextesPublicitesX20 else { return false }
      guard self.conventionnement == object.conventionnement else { return false }
      guard self.coupeDuMonde == object.coupeDuMonde else { return false }
      guard self.criteresRecherche == object.criteresRecherche else { return false }
      guard self.cvivSelectionnee == object.cvivSelectionnee else { return false }
      guard self.dateCreation == object.dateCreation else { return false }
      guard self.dateFraicheurDonneesAmeli == object.dateFraicheurDonneesAmeli else { return false }
      guard self.dateMiseaJour == object.dateMiseaJour else { return false }
      guard self.descriptions == object.descriptions else { return false }
      guard self.diplomes == object.diplomes else { return false }
      guard self.diplomesFormations == object.diplomesFormations else { return false }
      guard self.donneesBonsPlans == object.donneesBonsPlans else { return false }
      guard self.donneesPhotos == object.donneesPhotos else { return false }
      guard self.donneesPrestations == object.donneesPrestations else { return false }
      guard self.donneesProduits == object.donneesProduits else { return false }
      guard self.donneesVideos == object.donneesVideos else { return false }
      guard self.ecoResponsabilite == object.ecoResponsabilite else { return false }
      guard self.eligibleEdition == object.eligibleEdition else { return false }
      guard self.eligiblePushAnnonceur == object.eligiblePushAnnonceur else { return false }
      guard self.eligibleRemarketing == object.eligibleRemarketing else { return false }
      guard self.equipe == object.equipe else { return false }
      guard self.equipements == object.equipements else { return false }
      guard self.etabRepris == object.etabRepris else { return false }
      guard self.etage == object.etage else { return false }
      guard self.filActualite == object.filActualite else { return false }
      guard self.guides == object.guides else { return false }
      guard self.hasTransacSante == object.hasTransacSante else { return false }
      guard self.hebergement == object.hebergement else { return false }
      guard self.honoraires == object.honoraires else { return false }
      guard self.identifiantBloc == object.identifiantBloc else { return false }
      guard self.infoContributif == object.infoContributif else { return false }
      guard self.informationsCarte == object.informationsCarte else { return false }
      guard self.informationsCoordonnees == object.informationsCoordonnees else { return false }
      guard self.informationsHoraires == object.informationsHoraires else { return false }
      guard self.informationsOpenGraph == object.informationsOpenGraph else { return false }
      guard self.informationsSeo == object.informationsSeo else { return false }
      guard self.informationsTarifaires == object.informationsTarifaires else { return false }
      guard self.languesParlees == object.languesParlees else { return false }
      guard self.lienFdLafourchette == object.lienFdLafourchette else { return false }
      guard self.lienFicheDetailleeLafourchette == object.lienFicheDetailleeLafourchette else { return false }
      guard self.liensCatalogues == object.liensCatalogues else { return false }
      guard self.liensTransactionnels == object.liensTransactionnels else { return false }
      guard self.lstDonneesMarques == object.lstDonneesMarques else { return false }
      guard self.lstEquipementsSportifs == object.lstEquipementsSportifs else { return false }
      guard self.lstMoyensPaiement == object.lstMoyensPaiement else { return false }
      guard self.lstNomsChefs == object.lstNomsChefs else { return false }
      guard self.lstTypesCuisines == object.lstTypesCuisines else { return false }
      guard self.mentionsObligatoires == object.mentionsObligatoires else { return false }
      guard self.menu == object.menu else { return false }
      guard self.nbChambres == object.nbChambres else { return false }
      guard self.nombreCouverts == object.nombreCouverts else { return false }
      guard self.organisation == object.organisation else { return false }
      guard self.packPresenceManagement == object.packPresenceManagement else { return false }
      guard self.promotionsLafourchette == object.promotionsLafourchette else { return false }
      guard self.publications == object.publications else { return false }
      guard self.recommandationsPro == object.recommandationsPro else { return false }
      guard self.regroupementsActivites == object.regroupementsActivites else { return false }
      guard self.reseaux == object.reseaux else { return false }
      guard self.restaurants == object.restaurants else { return false }
      guard self.restauration == object.restauration else { return false }
      guard self.sensible == object.sensible else { return false }
      guard self.sitesEtReseauxSociaux == object.sitesEtReseauxSociaux else { return false }
      guard self.specialites == object.specialites else { return false }
      guard self.titre == object.titre else { return false }
      guard self.transactionnel == object.transactionnel else { return false }
      guard self.typeEtablissement == object.typeEtablissement else { return false }
      guard self.typeInscription == object.typeInscription else { return false }
      guard self.typeParcoursTransac == object.typeParcoursTransac else { return false }
      guard self.typeTransacRdv == object.typeTransacRdv else { return false }
      guard self.typesClientele == object.typesClientele else { return false }
      guard self.visuel == object.visuel else { return false }
      guard self.visuels == object.visuels else { return false }
      guard self.vitrinesAnnonces == object.vitrinesAnnonces else { return false }
      guard self.vitrinesProduitsServices == object.vitrinesProduitsServices else { return false }
      guard self.zonesChalandise == object.zonesChalandise else { return false }
      return true
    }

    public static func == (lhs: SKRProfessionnel, rhs: SKRProfessionnel) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}
